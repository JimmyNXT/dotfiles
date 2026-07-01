{ ... }:
{
  xdg.configFile."Thunar/accels.scm" = {
    force = true;
    text = ''
      ; Thunar GtkAccelMap rc file
      (gtk_accel_path "<Actions>/ThunarStandardView.set-icon-view" "")
      (gtk_accel_path "<Actions>/ThunarStandardView.set-list-view" "")
      (gtk_accel_path "<Actions>/ThunarStandardView.set-details-view" "")
    '';
  };
}
