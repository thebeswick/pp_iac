### Lab 1 Packer

1.  Install Chocolatey Windows package manager from https://chocolatey.org/
	* I used the Powershell method to install (remember to run Powershell as Administrator)
2. use choco to install the following packages
`choco install git.install`
`choco install packer`
3. Fork the following Github repo https://github.com/thebeswick/pp_iac_labs.git
4. Clone your newly forked repo with "git clone"
5. Navigate to the packer/src/lab1 directory
6. Review the contents of the lab1.json file from the Github repo, and try and follow what will happen
7. Ensure that you have the following environment Variables set, you can of course use a different region if you prefer
[![Environment Variables](https://github.com/thebeswick/pp_iac_labs/images/env_variables.png "Environment Variables")](https://github.com/thebeswick/pp_iac_labs/images/env_variables.png)
8. Use Packer to validate and build
`packer validate ex1_lab1.json`
`packer build ex1_lab1.json`
9.  Go into the AWS EC2 console and review whats happening with the build process, through the "Instances", "Volumes" and "Snapshots" in the left hand panel
10.  Review the resulting output and record the generated AMI name, we will use this in the next lab

#End of Lab 1
