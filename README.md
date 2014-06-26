# rectmsh

Simple mesh generator for finite difference simulators (e.g. FDTD and FDFD).

* example/msa/ex1.m explains how to model a microstrip antenna from arrays consisting of 0 and 1.
* example/ring/ring.m explains how to model a rat-race coupler from polygon data.

# Usage

    $ cd example/msa
    $ octave ex1.m
    $ paraview & # (open "test.vtk" and press "Apply")

# Requirements

* http://www.gnu.org/software/octave/
* http://www.paraview.org/
