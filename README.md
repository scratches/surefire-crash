Broken build with surefire > 2.19 and Alpine JDK:

```
$ docker build -t foo .
$ docker run -ti foo
# cd /source
# ./mvnw install
...
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.20.1:test (default-test) on project appo: There are test failures.
[ERROR] 
[ERROR] Please refer to /source/target/surefire-reports for the individual test results.
[ERROR] Please refer to dump files (if any exist) [date]-jvmRun[N].dump, [date].dumpstream and [date]-jvmRun[N].dumpstream.
[ERROR] The forked VM terminated without properly saying goodbye. VM crash or System.exit called?
[ERROR] Command was /bin/sh -c cd /source && /usr/lib/jvm/java-1.8-openjdk/jre/bin/java -jar /source/target/surefire/surefirebooter3510938747541906908.jar /source/target/surefire 2018-03-12T08-53-57_688-jvmRun1 surefire77870329121965774tmp surefire_03692097491311877891tmp
[ERROR] Error occurred in starting fork, check output in log
[ERROR] Process Exit Code: 1
[ERROR] org.apache.maven.surefire.booter.SurefireBooterForkException: The forked VM terminated without properly saying goodbye. VM crash or System.exit called?
[ERROR] Command was /bin/sh -c cd /source && /usr/lib/jvm/java-1.8-openjdk/jre/bin/java -jar /source/target/surefire/surefirebooter3510938747541906908.jar /source/target/surefire 2018-03-12T08-53-57_688-jvmRun1 surefire77870329121965774tmp surefire_03692097491311877891tmp
[ERROR] Error occurred in starting fork, check output in log
[ERROR] Process Exit Code: 1
[ERROR] 	at org.apache.maven.plugin.surefire.booterclient.ForkStarter.fork(ForkStarter.java:686)
[ERROR] 	at org.apache.maven.plugin.surefire.booterclient.ForkStarter.fork(ForkStarter.java:535)
[ERROR] 	at org.apache.maven.plugin.surefire.booterclient.ForkStarter.run(ForkStarter.java:280)
[ERROR] 	at org.apache.maven.plugin.surefire.booterclient.ForkStarter.run(ForkStarter.java:245)
[ERROR] 	at org.apache.maven.plugin.surefire.AbstractSurefireMojo.executeProvider(AbstractSurefireMojo.java:1124)
[ERROR] 	at org.apache.maven.plugin.surefire.AbstractSurefireMojo.executeAfterPreconditionsChecked(AbstractSurefireMojo.java:954)
[ERROR] 	at org.apache.maven.plugin.surefire.AbstractSurefireMojo.execute(AbstractSurefireMojo.java:832)
[ERROR] 	at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo(DefaultBuildPluginManager.java:134)
[ERROR] 	at org.apache.maven.lifecycle.internal.MojoExecutor.execute(MojoExecutor.java:208)
[ERROR] 	at org.apache.maven.lifecycle.internal.MojoExecutor.execute(MojoExecutor.java:154)
[ERROR] 	at org.apache.maven.lifecycle.internal.MojoExecutor.execute(MojoExecutor.java:146)
[ERROR] 	at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject(LifecycleModuleBuilder.java:117)
[ERROR] 	at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject(LifecycleModuleBuilder.java:81)
[ERROR] 	at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build(SingleThreadedBuilder.java:51)
[ERROR] 	at org.apache.maven.lifecycle.internal.LifecycleStarter.execute(LifecycleStarter.java:128)
[ERROR] 	at org.apache.maven.DefaultMaven.doExecute(DefaultMaven.java:309)
[ERROR] 	at org.apache.maven.DefaultMaven.doExecute(DefaultMaven.java:194)
[ERROR] 	at org.apache.maven.DefaultMaven.execute(DefaultMaven.java:107)
[ERROR] 	at org.apache.maven.cli.MavenCli.execute(MavenCli.java:955)
[ERROR] 	at org.apache.maven.cli.MavenCli.doMain(MavenCli.java:290)
[ERROR] 	at org.apache.maven.cli.MavenCli.main(MavenCli.java:194)
[ERROR] 	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
[ERROR] 	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
[ERROR] 	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
...
```

It works if you change the `Dockerfile` to `FROM openjdk:8-jdk` (not Alpine), or if you downgrade surefire to 2.19.1.
