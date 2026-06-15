{ ... }: {
  flake.nixosModules.okular = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kdePackages.okular
    ];

    xdg.mime.enable = true;
    xdg.mime.defaultApplications = {
      "application/pdf" = "okularApplication_pdf.desktop";
      "application/x-gzpdf" = "okularApplication_pdf.desktop";
      "application/x-bzpdf" = "okularApplication_pdf.desktop";
      "application/x-wwf" = "okularApplication_pdf.desktop";
      "application/epub+zip" = "okularApplication_epub.desktop";
      "image/vnd.djvu" = "okularApplication_djvu.desktop";
      "application/x-mobipocket-ebook" = "okularApplication_mobi.desktop";
      "application/x-cbz" = "okularApplication_comicbook.desktop";
      "application/x-cbr" = "okularApplication_comicbook.desktop";
      "application/x-cbt" = "okularApplication_comicbook.desktop";
      "application/x-cb7" = "okularApplication_comicbook.desktop";
      "application/oxps" = "okularApplication_xps.desktop";
      "application/vnd.ms-xpsdocument" = "okularApplication_xps.desktop";
      "application/postscript" = "okularApplication_ghostview.desktop";
      "image/x-eps" = "okularApplication_ghostview.desktop";
    };
  };
}
