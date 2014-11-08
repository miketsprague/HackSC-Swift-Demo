HackSC-Swift-Demo
=================
[Link to the presentation](https://docs.google.com/presentation/d/1UPn5Nw2n_hY04G-c3O7KyDrpWworuUNR1bydH16WNho/edit?usp=sharing)

## Adding Alamofire + SwiftyJSON to your project
SwiftyJSON uses a certain version of Alamofire to guarentee that it works properly.  As such it uses git submodules.
This assumes that you have a local git repo for your project.

Type the following in the terminal located in your project's git repo directory.

``` git submodule add https://github.com/SwiftyJSON/Alamofire-SwiftyJSON ```

``` git submodule update --init --recursive ```

Next, you need to add the Alamofire-SwiftyJSON.xcodeproj as a subproject to your project in xcode and configure it.

* Open the Alamofire-SwiftyJSON folder, and drag Alamofire-SwiftyJSON.xcodeproj into the file navigator of your app project.
* In Xcode, navigate to the target configuration window, navigate to Build Phases, and add AlamofireSwiftyJSON.framework under the "Target Dependencies".
* Click on the + button at the top left of the panel and select "New Copy Files Phase". Rename this new phase to "Copy Frameworks", set the "Destination" to "Frameworks", and add AlamofireSwiftyJSON.framework.



Resources
==================
Link to SwiftyJSON
https://github.com/SwiftyJSON/SwiftyJSON

Link to Alamofire
https://github.com/Alamofire/Alamofire

### Must read tech blogs / newsletters
[NSHipster](http://www.nshipster.com): a journal of the overlooked bits in Objective-C, Swift, and Cocoa. Updated weekly.
[objc.io](http://www.objc.io/): not just objective c--they have swift too!
[iOS Dev Weekly](http://iosdevweekly.com/): hand picked round up of the best iOS development links every week.
[SoSoSwift](http://www.sososwift.com/): shitty website, good content regarding swift resources
[LearnSwift.tips](http://www.learnswift.tips/): A curated list of helpful resources to learn Swift. Tutorials, Code Samples, References and more! 
[cocoa controls](https://www.cocoacontrols.com/): shitty website, but a ton of awesome open source libraries updated frequently.

