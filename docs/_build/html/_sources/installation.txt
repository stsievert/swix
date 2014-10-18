

Installation
=============
1. Download `the repo`_ or `this file`_
2. Include the folder ``swix-master/swix/swix/swix`` in your project.
3. Modify your XCode bridging header to include the C functions. This can mean
   either copying swix's bridging header to your bridging header or `modify
   your Xcode project`_ to find swix's header in
   ``swix/objc/swix-Bridging-Header.h``.

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
