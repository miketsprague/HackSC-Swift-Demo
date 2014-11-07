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

