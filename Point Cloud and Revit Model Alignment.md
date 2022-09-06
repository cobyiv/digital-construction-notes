# Point Cloud and Revit Model Alignment

![image-20220906115502924](assets/Point%20Cloud%20and%20Revit%20Model%20Alignment___assets/image-20220906115502924.png)

## [0] Intro

The intent of this process is to correctly set-up, execute a 3D scan (using a Faro Scanner) in order to align the point-cloud to a Revit model using grid-line intersections and a known vertical datum. This process is more precise than the manual best-fit approach and uses Faro SCENE marker exports to transfer grid lines to DXF files.



## [1] Field Scanning Markers

**1.1** Prior to scanning place checkerboards on each end of grid lines for all main axial directions

<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image (37).jpg?raw=true" style="zoom:100%;" />

**1.2** place checkerboards for known vertical elevation datum

<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image (37)V.jpg?raw=true" style="zoom:100%;" />



## [MILESTONE] 3D SCAN

## [2] Marker Point Extraction [SCENE]

**2.1** After registering the scans together, create points using the `Mark Point` or `Mark Checker Board` tool in the respective scan's quick view

<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image (38).png?raw=true" style="zoom:100%;" />


**2.2** Name each marked point appropriately and then right-click and click `Reference on Folder Level`


<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image (39).png?raw=true" style="zoom:100%;" />

**2.3** After all grid lines and elevation datums are marked, named and referenced, export the entire Reference folder to a .DXF file. 

<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image (40).png?raw=true" style="zoom:100%;" />

## [3] Clean up / Export PC to .RCS/.RCP

**3.1** Clean up the point cloud

**3.2** Create a 'project point cloud'

**3.3** Export the project point cloud to .RCS or .RCP (.RCS tend to be faster and more responsive in Revit)



## [4A] ACAD - Convert .DXF to .DWG and add reference lines.

**4A.1** open the .DXF up in Autocad. Adjust the 'z' value of points to align to the known verticle datum (use properties panel)

**4A.2** Connect points together to create grid lines

**4A.3** Create a new line from the WCS (0,0,0) to a known grid-line intersection point. The gridline intersection point should have a z-value per step **#4.1**

<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image (37)_Datum.jpg?raw=true" style="zoom:100%;" />

**4A.4** Save .DWG

## [4B] RHINO - Convert .DXF to .DWG and add reference lines.

**4B.1** open up a blank Rhino model and check the units are set to match the export units used in SCENE (use SCENE's options menu to verify this)

**4B.2** set a Cplane to the known vertical datum. This can be accomplished by drawing a vertical line from the drawing origin up to the z datum height and referencing the line endpoint to create the Cplane.

![image (42)](assets/Point%20Cloud%20and%20Revit%20Model%20Alignment___assets/image%20(42).png)

**4B.3** Enable  `project object snaps` to Connect points together to create grid lines planar to the datum plane.

![image (41)](assets/Point%20Cloud%20and%20Revit%20Model%20Alignment___assets/image%20(41).png)

**4B.4** Disable `project objec snaps` and create a new line from the WCS (0,0,0) to a known grid line intersection point

**4B.5** Export a .DWG ensuring the 0,0,0 is the origin.

## [5] Link in point-cloud and .DWG layout files

**5.1** In Revit, link in the point-cloud using Origin to Internal Origin. <u>NOTE:</u> We have found that this place the point-cloud origin at the Project Base Point and will adjust in subsequent steps.

<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image-20220901160016139.png?raw=true" style="zoom:100%;" />

**5.2**  Link in the layout .DWG using Origin-to-Internal Origin and 'Place at:' a level of your choosing. Uncheck 'Orient to View' and 'Correct lines that are slightly off axis'

<img src="https://github.com/cobyiv/digital-construction-notes/blob/master/assets/Point Cloud and Revit Model Alignment___assets/image-20220901160351891.png?raw=true" style="zoom:100%;" />

**5.3** Take some test measurements on both files to ensure they are each scaled correctly. If either of them are not scaled correctly, open up the properties box and adjust the scale factor. In some cases it is an inch->Meters conversion or other unit issue.



## [6] Align Pointcloud -to- Layout .DWG

The next set of steps assume that there is a difference between where the project base point is and where the internal-origin is and thus creates alignment issues between the point-cloud and the layout .DWG. If you do now have this problem, confirm the point-cloud and .DWG are aligned perfectly and move to section [7].

**6.1** in a 'Site' plan (Site plan's are plans with infinite range and so they are good for this step) open VG settings and turn on the project base point and the origin.

**6.2** Select the point cloud and click on the move tool. first click on the project base point to initiate the move from the project base point and then move to the internal origin. This should correct the alignment in the X-Y plane between the Point-Cloud and the layout .DWG

**6.3** To correct the z-axis, navigate to a section or elevation view that can see the Origin, Project base-point, point-cloud and layout .DWG.

**6.4** Find the difference between the project base-point's height and the origin and move numerically using this exact value.

At this point the layout .DWG and the point-cloud should be aligned to each-other precisely.



## [7] Align the Pointcloud & Layout .DWG pairing with the Revit Model

**7.1** in the same view as **#6.3** select both the Pointcloud and Layout .DWG, zoom in and initiate a move using the move tool. First, select a line from the .DWG that is presumably located at a known elevation datum and move the Point cloud and .DWG to align with the a known elevation datum in the Revit Model.

**7.2** Next navigate to a plan view where one can see the point-cloud, Layout .DWG and Revit grid-lines.

**7.3** Select both the point-cloud and the layout .DWG and initiate the move tool. select the two objects from a grid-line intersection that is present in the Layout .DWG and move it to the corresponding grid-line intersection in Revit.

You should not have the Point-cloud precisely located with the Revit model in both the X-Y and Z axes.





#### Notes

```mermaid
graph TB;
    A(1 // Field scanning Markers)-->B{3D Scan};
    B-->C(2 // SCENE Marker Point Extraction);
    C-->D(3 // SCENE Clean-up & Export RCP);
    C.->E(4A ACAD Layout File)
    C.->F(4B RHINO Layout File)
    F-->G(5 REVIT align Pointcloud -to- layout .DWG)
    E-->G
    D-->G
    G-->H(6 REVIT Align Pointcloud & Layout .DWG paring with Revit Model)
    H-->I{Revit Model & Point Cloud Aligned}
```

​    
