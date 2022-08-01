

# Civil 3D



## Point Cloud to Surface Tutorial

### Links

1. [Civil 3D - Point Cloud to Surface [Youtube]](https://youtu.be/UixRizhZz68)
2. [Autodesk Article](https://knowledge.autodesk.com/search-result/caas/sfdcarticles/sfdcarticles/Creating-surfaces-from-AutoCAD-points.html)

### Walk Through

1. open new civil 3D projcet

2. Attach point cloud

   <img src="img\image-20220801141602654.png" alt="image-20220801141602654" style="zoom:67%;" />

3. Don't really need to change settings

![image-20220801141801367](img\image-20220801141801367.png)

4. in home tab, go to surface dropdown and select `create surface from Point Cloud`![image-20220801141916023](img\image-20220801141916023.png)

5. select the point cloud and then give it a name, change style

![image-20220801142001661](img\image-20220801142001661.png)

6. Reduce the amount of points in the 'distance between' option![image-20220801142143646](img\image-20220801142143646.png)

7. choose interpolation option (or other option)![image-20220801142318803](img\image-20220801142318803.png)

8. let is process and then examine the resultant surface. you can right click on surface and press `object viewer` to get a better preview of the surface![image-20220801142704484](img\image-20220801142704484.png)

9. to edit the contours or get better contours go to the toolspace existing surfaces, right click and click surface properties.![image-20220801143154932](img\image-20220801143154932.png)

10. Create a copy of current selection

![image-20220801143255808](img\image-20220801143255808.png)

11. Modify the contours to have finer granularity![image-20220801143338769](img\image-20220801143338769.png)

12. click apply/ok and see result

    ![image-20220801143452207](img\image-20220801143452207.png)

12. create clipping border with a polyline tool (must be closed)![image-20220801143619130](img\image-20220801143619130.png)

13. add border to the surface
14. Add labels if desired![image-20220801143954331](img\image-20220801143954331.png)

15. change scale of drawing to adjust scale of labels

16. Mesh created![image-20220801144133543](img\image-20220801144133543.png)