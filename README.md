# Snowflake  

A NixOS configuration flake for a streamlined system setup. This repository provides an easy way to configure and rebuild your NixOS system with reproducibility and efficiency.  

## Features  
- Custom hardware configurations.
- Modular and reusable NixOS settings.
- Easily adaptable for personal use.  

## Installation  

Follow the steps below to use this configuration:

### 1. Clone the Repository  
Clone the repository into your NixOS configuration directory:  
```bash  
git clone https://github.com/hambosto/snowflake.git ~/.config/snowflake  
```  

### 2. Change Directory  
Navigate to the repository directory:  
```bash  
cd ~/.config/snowflake  
```  

### 3. Generate Hardware Configuration  
Generate the hardware configuration for your system:  
```bash  
nixos-generate-config --show-hardware-config > modules/hardware-configuration/default.nix  
```  
This ensures the configuration aligns with your hardware setup.  

### 4. Apply the Configuration  
Rebuild your NixOS system using the `snowflake` flake:  
```bash  
sudo nixos-rebuild switch --flake ~/.config/snowflake#snowflake  
```  

## Customization  

Feel free to edit the configuration files under the `nixos/` directory to suit your needs. The modular structure makes it easy to add or adjust configurations for specific packages, services, or system settings.  

## Troubleshooting  

If you encounter issues during the rebuild, consider the following:  
- Verify that your hardware configuration is correct.  
- Ensure the Nix Flakes feature is enabled.  
- Check the repository for updates or file an issue if the problem persists.  

## Contributions  

Contributions, issues, and feature requests are welcome! Fork the repository and create a pull request or submit issues directly to the GitHub repository.  

## License  

This project is licensed under the [MIT License](LICENSE).  
