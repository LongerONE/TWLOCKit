# TWLOCKit


## 1.不使用 `use_frameworks!`

```
# use_frameworks!
 pod 'TWLOCKit', '0.0.1'
```

## 2.使用 `use_frameworks!`

```
  use_frameworks!
  
  pod 'TWLOCKit', '0.0.1'
  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
  end
```