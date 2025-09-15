// Copyright 2025 Google LLC
// Licensed under the Apache License, Version 2.0 (the "License")
// Simple memory leak demonstration and test for OR-Tools Java Linear Solver

package com.google.ortools.linearsolver.samples;

import com.google.ortools.Loader;
import com.google.ortools.linearsolver.MPSolver;
import com.google.ortools.linearsolver.MPVariable;

/**
 * Demonstrates the memory leak issue in OR-Tools Java Linear Solver
 * and shows the proper cleanup pattern to prevent it.
 */
public final class MemoryLeakDemo {
  
  /**
   * Example of BAD usage that leads to memory leaks - DON'T DO THIS!
   * Creates solvers without proper cleanup
   */
  private static void badUsageExample() {
    System.out.println("=== BAD USAGE EXAMPLE (causes memory leaks) ===");
    for (int i = 0; i < 100; i++) {
      MPSolver solver = MPSolver.createSolver("GLOP");
      if (solver == null) continue;
      
      // Create some variables and constraints
      MPVariable x = solver.makeNumVar(0.0, 1.0, "x" + i);
      solver.objective().setCoefficient(x, 1.0);
      solver.solve();
      
      // BUG: No solver.delete() call - memory leak!
      // The native C++ resources are not cleaned up
    }
    System.out.println("Created 100 solvers without cleanup - memory leaked!");
  }
  
  /**
   * Example of GOOD usage with proper resource management
   */
  private static void goodUsageExample() {
    System.out.println("\n=== GOOD USAGE EXAMPLE (prevents memory leaks) ===");
    for (int i = 0; i < 100; i++) {
      MPSolver solver = MPSolver.createSolver("GLOP");
      if (solver == null) continue;
      
      try {
        // Create some variables and constraints
        MPVariable x = solver.makeNumVar(0.0, 1.0, "x" + i);
        solver.objective().setCoefficient(x, 1.0);
        solver.solve();
        
        // Use the solution...
        
      } finally {
        // IMPORTANT: Always clean up native resources
        solver.delete();
      }
    }
    System.out.println("Created 100 solvers with proper cleanup - no memory leak!");
  }
  
  public static void main(String[] args) {
    Loader.loadNativeLibraries();
    
    System.out.println("OR-Tools Java Linear Solver Memory Management Demo");
    System.out.println("This demonstrates the importance of calling solver.delete()");
    System.out.println();
    
    // Show both bad and good usage
    // In production, monitor memory usage to see the difference
    badUsageExample();
    
    // Force garbage collection to show that it doesn't clean up native resources
    System.gc();
    System.out.println("After System.gc() - native memory still leaked from bad example");
    
    goodUsageExample();
    
    System.out.println("\n=== LESSON LEARNED ===");
    System.out.println("Always use try-finally blocks with solver.delete() to prevent memory leaks!");
    System.out.println("The SWIG-generated Java wrapper requires manual cleanup of native resources.");
  }
  
  private MemoryLeakDemo() {}
}