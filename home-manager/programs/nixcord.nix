{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeManagerModules.nixcord ];

  programs.nixcord = {
    enable = false;
    discord = {
      enable = false;
      vencord.enable = true;
      openASAR.enable = true;
    };
    vesktop.enable = true;
    config = {
      frameless = true;
      transparent = true;
      disableMinSize = true;
      plugins = {
        alwaysAnimate.enable = true;
        alwaysExpandRoles.enable = true;
        alwaysTrust.enable = true;
        anonymiseFileNames.enable = true;
        betterFolders.enable = true;
        betterGifAltText.enable = true;
        betterRoleContext.enable = true;
        betterRoleDot.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNSFW.enable = true;
        clearURLs.enable = true;
        consoleJanitor.enable = true;
        copyFileContents.enable = true;
        copyUserURLs.enable = true;
        fakeNitro.enable = true;
        fixImagesQuality.enable = true;
        hideAttachments.enable = true;
        moreKaomoji.enable = true;
        noTypingAnimation.enable = true;
        noUnblockToJump.enable = true;
        nsfwGateBypass.enable = true;
        onePingPerDM.enable = true;
        petpet.enable = true;
        pictureInPicture.enable = true;
        readAllNotificationsButton.enable = true;
        reverseImageSearch.enable = true;
        serverInfo.enable = true;
        showHiddenChannels.enable = true;
        silentTyping.enable = true;
        USRBG.enable = true;
        vencordToolbox.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
