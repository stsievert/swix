
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
5. (optional) If you plan on using read_csv, write_csv or savefig, you need to
   change the ``S2_PREFIX`` in ``numbers.swift``

.. _this file: https://github.com/scottsievert/swix/archive/master.zip
.. _the repo: https://github.com/scottsievert/swix
.. _modify your Xcode project: http://stackoverflow.com/a/24102433/1141256
.. _your compiler optimization flag: http://stackoverflow.com/a/24102759/1141256 
.. _incredible speed gains: http://stackoverflow.com/questions/24102609/why-swift-is-100-times-slower-than-c-in-this-image-processing-test
