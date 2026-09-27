{ ... }:
{
  flake.nixosModules.android-development =
    { pkgs, unstable, ... }:
    {
      # Android Studio moves fast — pulling from unstable keeps SDK/AGP compatibility current.
      environment.systemPackages = with pkgs; [
        unstable.android-studio
        jdk21          # CLI builds/tools outside Android Studio's bundled JBR
        gradle         # for running gradle without a project's ./gradlew wrapper
        android-tools  # adb, fastboot
      ];

      # GPU-accelerated rendering for the emulator (formerly hardware.opengl).
      hardware.graphics = {
        enable = true;
        enable32Bit = true; # some SDK/emulator components are still 32-bit
      };

      # Emulator needs /dev/kvm for hardware acceleration.
      boot.kernelModules = [ "kvm-intel" ]; # swap for "kvm-amd" on Ryzen/EPYC

      # Android Studio + SDK components are unfree.
      nixpkgs.config.allowUnfree = true;

      environment.sessionVariables = {
        ANDROID_HOME = "$HOME/Android/Sdk";
        ANDROID_SDK_ROOT = "$HOME/Android/Sdk";
      };
    };
}
