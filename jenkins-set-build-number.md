Set:
`Jenkins.instance.getItemByFullName("YourJobName").updateNextBuildNumber(45)`

Verify:
`Jenkins.instance.getItemByFullName("YourJobName").getNextBuildNumber()`
