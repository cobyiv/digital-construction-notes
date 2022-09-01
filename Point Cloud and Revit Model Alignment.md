# Point Cloud -to- Revit Alignment



## [0] Intro

The intent of this process is to correctly set-up, execute a 3D scan (using a Faro Scanner) in order to align the point-cloud to a Revit model using grid-line intersections and a known vertical datum. This process is more precise than the manual best-fit approach and uses Faro SCENE marker exports to transfer grid lines to DXF files.



## [1] Field Scanning Markers

**1.1** Prior to scanning place checkerboards on each end of grid lines for all main axial directions

![image (37)](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image (37).jpg)

**1.2** place checkerboards for known vertical elevation datum

![image (37)V](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image (37)V.jpg)



## [2] Marker Point Extraction [SCENE]

**2.1** After registering the scans together, create points using the `Mark Point` or `Mark Checker Board` tool in the respective scan's quick view

![image (38)](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image (38).png)

**2.2** Name each marked point appropriately and then right-click and click `Reference on Folder Level`



![image (39)](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image (39).png)

**2.3** After all grid lines and elevation datums are marked, named and referenced, export the entire Reference folder to a .DXF file. ![image (40)](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image (40).png)

## [3] Clean up / Export PC to .RCS/.RCP

**3.1** Clean up the point cloud

**3.2** Create a 'project point cloud'

**3.3** Export the project point cloud to .RCS or .RCP (.RCS tend to be faster and more responsive in Revit)



## [4] Convert .DXF to .DWG and add reference lines.

**4.1** open the .DXF up in Autocad. Adjust the 'z' value of points to align to the known verticle datum (use properties panel)

**4.2** Connect points together to create grid lines

**4.3** Create a new line from the WCS (0,0,0) to a known grid-line intersection point. The gridline intersection point should have a z-value per step **#4.1**

![image (37)_Datum](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image (37)_Datum.jpg)

**4.4** Save .DWG

## [5] Link in point-cloud and .DWG layout files

**5.1** In Revit, link in the point-cloud using Origin to Internal Origin. <u>NOTE:</u> We have found that this place the point-cloud origin at the Project Base Point and will adjust in subsequent steps.

 ![image-20220901160016139](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image-20220901160016139.png)

**5.2**  Link in the layout .DWG using Origin-to-Internal Origin and 'Place at:' a level of your choosing. Uncheck 'Orient to View' and 'Correct lines that are slightly off axis'

![image-20220901160351891](C:\Users\Coby.Vardy\Documents\coding\digital-construction-notes\assets\Point Cloud and Revit Model Alignment___assets\image-20220901160351891.png)



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

