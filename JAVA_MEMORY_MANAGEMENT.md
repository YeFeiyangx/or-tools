# Java Memory Management for OR-Tools Linear Solver

## Problem
The OR-Tools Java linear solver has memory management issues that can lead to memory leaks. The Java wrapper is generated using SWIG and wraps native C++ code, but the Java garbage collector cannot automatically clean up the native C++ resources.

## Root Cause
- SWIG-generated Java classes wrap native C++ objects
- Java GC only cleans up Java objects, not the underlying native C++ objects
- `MPSolver.createSolver()` allocates native resources that must be manually freed
- Examples and user code often forget to call `solver.delete()`

## Solution
Always use try-finally blocks to ensure proper cleanup:

### ✅ Good Pattern (Prevents Memory Leaks)
```java
MPSolver solver = MPSolver.createSolver("GLOP");
if (solver == null) {
    System.out.println("Could not create solver");
    return;
}
try {
    // Create variables, constraints, solve...
    MPVariable x = solver.makeNumVar(0.0, 1.0, "x");
    // ... use the solver ...
    solver.solve();
    
} finally {
    // CRITICAL: Always clean up native resources
    solver.delete();
}
```

### ❌ Bad Pattern (Causes Memory Leaks) 
```java
MPSolver solver = MPSolver.createSolver("GLOP");
// ... use the solver ...
solver.solve();
// BUG: Missing solver.delete() - memory leak!
```

## Files Fixed
This PR fixes the memory management in these example files:
- `ortools/linear_solver/samples/BasicExample.java`
- `ortools/linear_solver/samples/SimpleLpProgram.java`
- `ortools/linear_solver/samples/SimpleMipProgram.java` 
- `ortools/linear_solver/samples/LinearProgrammingExample.java`
- `ortools/linear_solver/samples/StiglerDiet.java`
- `examples/contrib/StiglerMIP.java`

## Best Practices
1. **Always use try-finally** when creating solvers
2. **Call solver.delete()** in the finally block
3. **One solver per try-finally** - don't share solvers across different scopes
4. **Monitor memory usage** in production applications
5. **Consider wrapper patterns** for automatic cleanup in your applications

## Testing
The new `MemoryLeakDemo.java` demonstrates:
- How memory leaks occur without proper cleanup
- The correct cleanup pattern
- That Java GC cannot clean up native resources

## Impact
This addresses the memory and performance issues mentioned in the problem statement, particularly affecting versions 9.4 and later where the SWIG wrappers require explicit cleanup.