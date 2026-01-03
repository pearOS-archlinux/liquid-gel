# Better Blur
Better Blur is a fork of the Plasma 6 blur effect with additional features and bug fixes.

![image](https://github.com/user-attachments/assets/f8a7c618-89b4-485a-b0f8-29dd5f77e3ca)

### Features
- X11 and Wayland support
- Force blur
- Rounded corners with anti-aliasing
- Static blur for much lower GPU usage
- Adjust blur brightness, contrast and saturation
- Refraction (by [@DaddelZeit](https://github.com/DaddelZeit) and [@iGerman00](https://github.com/iGerman00))

### Bug fixes
Fixes for blur-related Plasma bugs that haven't been patched yet.

- Blur may sometimes disappear during animations
- [Transparent color schemes don't work properly with the Breeze application style](https://github.com/taj-ny/kwin-effects-forceblur/pull/38)

### Support for previous Plasma releases
Better Blur will usually support at least one previous Plasma release (second number in version - 6.x). Exceptions may be made if there is a large amount of breaking 
changes.

Currently supported versions: **6.4**

# Installation
> [!IMPORTANT]
> If the effect stops working after a system upgrade, you will need to rebuild it or reinstall the package.

## Manual

### Dependencies
- CMake
- Extra CMake Modules (required - package name: `extra-cmake-modules` on Arch Linux)
- Plasma 6
- Qt 6
- KF6
- KWin development packages

<details>
  <summary>Arch Linux</summary>
  <br>

  Wayland:
  ```
  sudo pacman -S base-devel git extra-cmake-modules qt6-tools kwin
  ```
  
  X11:
  ```
  sudo pacman -S base-devel git extra-cmake-modules qt6-tools kwin-x11
  ```
</details>

<details>
  <summary>Debian-based (KDE Neon, Kubuntu, Ubuntu)</summary>
  <br>

  Wayland:
  ```
  sudo apt install -y git cmake g++ extra-cmake-modules qt6-tools-dev kwin-dev libkf6configwidgets-dev gettext libkf6crash-dev libkf6globalaccel-dev libkf6kio-dev libkf6service-dev libkf6notifications-dev libkf6kcmutils-dev libkdecorations3-dev libxcb-composite0-dev libxcb-randr0-dev libxcb-shm0-dev
  ```
  
  X11:
  ```
  sudo apt install -y git cmake g++ extra-cmake-modules qt6-tools-dev kwin-x11-dev libkf6configwidgets-dev gettext libkf6crash-dev libkf6globalaccel-dev libkf6kio-dev libkf6service-dev libkf6notifications-dev libkf6kcmutils-dev libkdecorations3-dev libxcb-composite0-dev libxcb-randr0-dev libxcb-shm0-dev
  ```
</details>

### Building
```sh
git clone https://github.com/pearOS-archlinux/liquid-gel
cd liquid-gel
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j$(nproc)
sudo make install
```


# Usage
This effect will conflict with the stock blur effect and any other forks of it.

1. Install the plugin.
2. Open the *Desktop Effects* page in *System Settings*.
3. Disable any blur effects.
4. Enable the *Better Blur* effect.

For more detailed descriptions of some options, check out [this wiki page](https://github.com/taj-ny/kwin-effects-forceblur/wiki/Configuration).

### Window transparency
The window needs to be translucent in order for the blur to be visible. This can be done in multiple ways:
- Use a transparent theme for the program if it supports it
- Use a transparent color scheme, such as [Alpha](https://store.kde.org/p/1972214)
- Create a window rule that reduces the window opacity

### Obtaining window classes
The classes of windows to blur can be specified in the effect settings. You can obtain them in two ways:
  - Run ``qdbus org.kde.KWin /KWin org.kde.KWin.queryWindowInfo`` and click on the window. You can use either *resourceClass* or *resourceName*.
  - Right click on the titlebar, go to *More Options* and *Configure Special Window/Application Settings*. The class can be found at *Window class (application)*. If there is a space, for example *Navigator firefox*, you can use either *Navigator* or *firefox*.

# High cursor latency or stuttering on Wayland
This effect can be very resource-intensive if you have a lot of windows open. On Wayland, high GPU load may result in higher cursor latency or even stuttering. If that bothers you, set the following environment variable: ``KWIN_DRM_NO_AMS=1``. If that's not enough, try enabling or disabling the software cursor by also setting ``KWIN_FORCE_SW_CURSOR=0`` or ``KWIN_FORCE_SW_CURSOR=1``.

Intel GPUs use software cursor by default due to [this bug](https://gitlab.freedesktop.org/drm/intel/-/issues/9571), however it doesn't seem to affect all GPUs.

# Credits
- [a-parhom/LightlyShaders](https://github.com/a-parhom/LightlyShaders) - CMakeLists.txt files
