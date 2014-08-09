
Installation
=============
1. Download `the repo`_ or `this file`_
2. Include the folder ``swix/swix/swix/swix`` in your project.
3. Modify your XCode bridging header to include the C functions. This can mean
   either copying swix's bridging header to your bridging header or `modify
   your Xcode project`_ to find swix's header.
4. (optional) Change `your compiler optimization flag`_ which can lead to
   `incredible speed gains`_. Be careful -- this skips ``assert``. I would
   recommend testing with ``-Onone`` before switching.
5. (optional) If you plan on using ``read_csv, write_csv, savefig, imshow`` you need to
   change the ``S2_PREFIX`` in ``numbers.swift``. This should point to the swix
   folder; something like ``the/path/to/yourXcodeProjectName/swix/``


Possible bugs
---------------
* If you get errors like ``"Unresolved identifier *_objc"`` you probably haven't added the
  bridging header correctly.
* ``".../swix/objc/OpenCV.h:12: 'opencv2/opencv.hpp' file not found".`` This bug
  had me for a while since opencv2.framework was clearly in my project.. It
  turns out under Build Phases/Link Binary with Libraries you need to "add
  other" and select the opencv2.framework in swix/objc/. Oh, and if you can't
  see the "Link Binary with Libraries" section hit the little "+" in the upper
  left (at least for XCode 6).


.. _this file: https://github.com/scottsievert/swix/archive/master.zip
.. _the repo: https://github.com/scottsievert/swix
.. _modify your Xcode project: http://stackoverflow.com/a/24102433/1141256
.. _your compiler optimization flag: http://stackoverflow.com/a/24102759/1141256 
.. _incredible speed gains: http://stackoverflow.com/questions/24102609/why-swift-is-100-times-slower-than-c-in-this-image-processing-test
