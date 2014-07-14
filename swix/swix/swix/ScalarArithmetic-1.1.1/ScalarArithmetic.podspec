Pod::Spec.new do |s|
  name           = "ScalarOperatable"
  url            = "https://github.com/seivan/#{name}"
  git_url        = "#{url}.git"
  s.name         = name
  version        = "1.1.1"
  source_files   = "#{name}/**/*.{swift}"

  s.version      = version
  s.summary      = "Operators for Double and math properties and functions"
  s.description  = <<-DESC

                    * Using generics to unify the three different structs
                    * Add the protocol easily on top of your own similar structs
                    * Namespaced generic functions to use with other structs if necessary. 
                    * Perform operations on two different generic types CGPoint - CGVector -> CGPoint (always returns lhs)
                    * Well-tested & documented and lightweight
                    * Easy selectors to get started quickly. 
                    
                    DESC

  s.homepage     = url
  s.license      = 'MIT'
  s.author       = { "Seivan Heidari" => "seivan.heidari@icloud.com" }
  
  s.source       = { :git => git_url, :tag => version}
  
  
  s.platform  = :ios, "8.0"

  s.source_files = source_files

  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/seivan'



end
