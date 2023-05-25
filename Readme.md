# Setup Script

This setup script is designed to automate the installation and configuration process for various development environments. It now runs all the scripts automatically, no longer requiring manual input.

## Prerequisites

- This script is intended for Unix-based systems.
- Make sure you have the necessary permissions to execute the script and install packages.

## Usage

1. Clone or download the repository to your local machine.

2. Open a terminal and navigate to the project directory.

3. Make sure the script file has execution permissions. If not, you can use the `chmod +x setup.sh` command to grant execution permissions.

4. Run the script by executing the following command: `./setup.sh`

5. Follow the on-screen prompts to select the options for your desired setup. Use the numeric keys to make your selections and press Enter.

6. The script will install and configure the selected components. During the process, you may be asked for additional input or confirmation.

7. Once the setup is complete, you will see a success message indicating that the setup process is finished.

## Customization

You can customize the setup script by modifying the individual setup scripts in the corresponding directories. Each setup script is responsible for installing and configuring a specific component.

- The `languages` directory contains setup scripts for different programming languages.
- The `databases` directory contains setup scripts for different databases.
- The `system` directory contains setup scripts for system configurations, such as web servers, dock configuration, Oh My Zsh, etc.
- The tools directory contains setup scripts for additional tools such as `Slack`, `Spotify`, and `GitHub Desktop`.
- The `customize` directory contains setup scripts for system customizations like dock setup.

You can update the existing setup scripts or create new ones to add support for additional components or customize the installation process according to your requirements.

## Contributing

Contributions to this setup script are welcome! If you have any suggestions, improvements, or bug fixes, please submit a pull request.

## License

This setup script is open-source and released under the [MIT License](LICENSE).
