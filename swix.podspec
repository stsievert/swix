Pod::Spec.new do |s|
  s.name         = "swix"
  s.version      = "0.0.1"
  s.summary      = "Swift Matrix Library"
  s.description  = "This was written to allow help facilitate easy conversion
                   between heavy signal processing algorithms onto mobile devices. 
                   Before, this required converting between Python/Matlab to C
                   which was a huge pain. This helps with that transition.
                   
                   To be clear, this library provides *basic* access to

                   * +-*/ as it should be. zeros(4)+1 = ones(4)
                   * nice initialization
                   * dot product
                   * some LAPACK/BLAS integration
                   * FFT/IFFT (1d only)
                   * OpenCV library
                   * swift-complex
                   "
  s.homepage     = "https://github.com/scottsievert/swix"
  s.author             = { "scottsievert" => "sieve121@umn.edu" }
  s.social_media_url   = "http://twitter.com/stsievert"
  s.source       = { :git => "https://github.com/scottsievert/swix.git", :commit => "a7c6282a15"}
  s.frameworks  = "swift-complex", "OpenCV"
  s.license = "MIT"
  s.requires_arc = true

end
