Installation
=============

Easy installation
-------------------

This option gives a simple iOS app that integrates swix:

1. Dowload `the repo`_ or `this file`_
2. The iOS app is ``swix_ios_app/``. Open it up and play with it!

This method gives a command-line tool that can be run on OSX.

1. Download `the repo`_ or `this file`_
2. You're done! You'll have your project structure in ``swix-master/swix/``,
   complete with a ``.xcodeproj`` and all that. The two files you care about are
   ``swix.xcodeproj`` and ``swix/``.
3. Open up ``swix.xcodeproj`` and run the tests.

Running Python/NumPy on iOS
---------------------------
Two projects exist that allow Python to run on iOS, `kivy-ios`_ and `beeware`_.

**kivy-ios**:As of 2016-05-02, a new xcodeproj can be created by
exactly following the instructions in the readme. Importantly, don't forget to
run ``./toolchain.py build numpy`` then updating the xcodeproj.

This tool can run NumPy. 

When creating a GUI with the Kivy framework in your app "main.py", the GUI
looks like Kivy, not native. This is suitable if you're trying to create the
same application across many devices, which the Kivy framework allows.

**beeware**: An example iOS project can be found at `beeware-ios-template`_. In
this, the app is written completely in Python and can call native APIs
naturally (i.e., you have access to all possible iOS APIs).

The BeeWare framework can not run NumPy as of 2016-05-02, but it's on the
roadmap. This depends on `Python-iOS-support`_ and there's `issue #23`_ tracks
it.

.. _`issue #23`: https://github.com/pybee/Python-iOS-support/issues/23
.. _`Python-iOS-support`: https://github.com/pybee/Python-iOS-support
.. _`beeware-ios-template`: http://github.com/pybee/Python-iOS-template
.. _`kivy-ios`: https://github.com/kivy/kivy-ios
.. _`beeware`: http://pybee.org

Manual installation
---------------------

This method can be generalized to any Swift project, whether it be iOS or OSX.

1. Download `the repo`_ or `this file`_
2. Include the folder ``swix-master/swix/swix/swix`` in your project. The folder
   you want is right next to a ``main.swift``
3. Add (or modify) your Swift bridging header to include some Objective-C/C
   functions. Essentially, this means copying the image below to include
   ``swix/objc/swix-Bridging-Header.h`` in "Swift Compiler -- Code Generation"
   under "Project".

.. image:: imgs/header.png

4. Done! To test, try inserting in ``main.swift`` or in ``viewDidLoad`` ::

    var x = arange(10)
    var y = sqrt(x)
    print(x)
    print(y)

.. _`issue #24`: https://github.com/stsievert/swix/issues/24

How to creat a new iOS app that includes swix
------------------------------------------------
This is a more detailed version of the section on manual installation.

1. Open Xcode and select to make a new iOS project.
2. Be sure to select the source language as Swift

.. image:: imgs/swift.png

3. Add the swix folder to your iOS app and copy the files. The swix folder is
   in the same folder and right next to a ``main.swift``. The path should be
   ``swix-master/swix/swix/swix/``

.. image:: imgs/add.png

3a. Make sure to check the box "Copy files if needed"!

.. image:: imgs/copy.png

4. Go to your main project settings (the blue thing file at the very top of the
   left sidebar) and change the Swift bridging header in "Swift Compiler -- Code
   Generation"

.. image:: imgs/header.png

5. Build your project with ⌘R!

Optional
-----------
These steps are optional but can have nice results.

1. Change `your compiler optimization flag`_ which can lead to
   `incredible speed gains`_. Be careful -- this skips ``assert``. I would
   recommend testing with ``-Onone`` before switching.
2. If you plan on using ``read_csv, write_csv, savefig, imshow`` you need to
   change the ``S2_PREFIX`` in ``numbers.swift``. This should point to the swix
   folder; something like ``the/path/to/yourXcodeProjectName/swix/``

Notes
-------
* I have not spent time on package management. There should be an ``import
  swix`` and is not (but I welcome pull requests!)
* During my testing, swix doesn't work in Playgrounds although `it's possible`_.

.. _`it's possible`: http://stackoverflow.com/questions/24046160/how-to-i-import-3rd-party-frameworks-into-xcode-playground


Possible bugs
---------------

I have marked other installation issues on GitHub with the "question" tag,
viewable with the search `is:issue label:question`__

__ https://github.com/stsievert/swix/issues?utf8=✓&q=is%3Aissue+label%3Aquestion

* Xcode can't find the functions but seems to compile/etc correctly. 
    * Cleaning before building can help with this . More details are described
      in `issue #24`_. Part of this is making sure "Copy if needed" is selected
      copying swix into an Xcode project.
* ``"Unresolved identifier *_objc"``
    * The bridging header probably hasn't been added correctly. Ensure
      ``swix/objc/swix-Bridging-Header.h`` has the correct path.
* ``Unresolved identifier vDSP_*`` or similar,
    * The Accelerate framework hasn't been added to Build Phases/Link Binary with Libraries.
    * The Accelerate framework can't be found when running an iOS xcodeproj in
      the iOS simulator. For me it works on a physical device.
* ``".../swix/objc/OpenCV.h:12: 'opencv2/opencv.hpp' file not found".``
    * Under Build Phases/Link Binary with library add
      ``swix/objc/opencv2.framework``. If you don't see the "Link Binary with
      Libraries" hit the plus button in the upper left (at least for XCode 6).
    * When clicking on "Add files to *" and in the diaglog that came up I
      should have hit the checkbox next to ``swix-OSXTests``.

.. _this file: https://github.com/scottsievert/swix/archive/master.zip
.. _the repo: https://github.com/scottsievert/swix
.. _modify your Xcode project: http://stackoverflow.com/a/24102433/1141256
.. _your compiler optimization flag: http://stackoverflow.com/a/24102759/1141256
.. _incredible speed gains: http://stackoverflow.com/questions/24102609/why-swift-is-100-times-slower-than-c-in-this-image-processing-test
