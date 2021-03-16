# ApproximateRoleAssignmentForMLNs
Accompanying code that can be used to compute the notion of Approximate Role Assignment for Multiplex Multi-Layer Networks

1. Download the instance "PADGETT FLORENTINE FAMILIES" from the CoMuNe Lab Repository ( https://manliodedomenico.com/data.php ). 
2. Extract the file that contains the multiplex ( Dataset/Padgett-Florentine-Families_multiplex.edges ) and place it in the same folder as the MATLAB scripts
3. Use MATLAB to run "Approximate_generateCRNerodeExperimentsScript.m" 
4. The script will output the files "experiments.ode" and "crn_Padgett-Florentine-Families_multiplex._ode". The latter cointains the PIVP translation of the original multiplex. 
5. Open ERODE ( https://www.erode.eu/download.html ) 
6. Create a new ERODE project (for example, "FlorenceExample") and drag/copy the files "experiments.ode" and "crn_Padgett-Florentine-Families_multiplex._ode" in the folder of the ERODE project
7. Open the file "experiments.ode" and click on "Execute ERODE Program"
8. The output will be a list of files:
- If there is an exact role assignment the file "red_*nameOfInstance*multiplex". If there is no exact role assignment (i.e., trivial partition with all singletons) that file will not be generated (this is the case for the Florence example)
- One file per epsilon named "Padgett-Florentine-Families_multiplex1" , where the 1 in the end indicates the resulting partition of 1-approximate role assignment.

In this repository you can find:
- CODE: a folder that contains the MATLAB scripts.
- ERODE INPUT: a folder that contains the output of the MATLAB scripts for the Florance Families benchmark. 
- ERODE OUTPUT: a folder that contains the output of ERODE, a collection of 25 files with the i-approximate role assignment for epsilon=i (i from 1 to 25)
