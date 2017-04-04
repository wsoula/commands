Software supply-chain management checklist

* Is the license of this dependency compatible with my project?
* Is the dependency actively maintained, and do I know where information about vulnerabilities in the dependency will be published?
* Is the version of the dependency I propose to include currently free from vulnerabilities? (Including any vulnerabilities in the transitive closure of dependencies).
* Do I have an active process in place to alert me when a new vulnerability is found in the dependency?
* Do I know where new versions of the dependency will be announced?
* Do I have an active process in place to alert me when a new version is released? (The release notes may contain information about important fixes that didn’t get flagged as a vulnerability for some reason).

Such a process works best if you also have an automated way to catch and flag any new dependency being added to a project – via commits or pull requests for example. (I’ve been using Snyk.io to do this on one of my recent projects, other tools are available). Then you can make sure to go through the checklist during code review – and perhaps even go so far as to fail the build if it is not completed. For your own reference, a good place to document the checklist answers (where to go to find vulnerability information, and the processes in place for notification) might be in a dependencies.md file or similar checked into the root of your project.
