Ben O'Brien Graduate Research Project
======================================

This is an attempt a migrating an unorganized SVN repo to git in order to:
>Make it so my grandmother could use it.

Purpose of this project
-------------------------------------
The purpose of this Graduate Research Project is to create a hardware interface and any related software that allows an embedded host running a Real Time Operating system to interface with simulated industrial systems. Unlike a standard PLC device, the Real Time hosts have a 4 channel, 32 bit digital I/O card that operates at TTL levels instead of the standard 24V levels of most PLCs. 
As a result it is difficult, if not prohibitively expensive, to find a pre-made hardware and/or software solution that meets the project requirements. This project attempts to find *low cost* solutions using existing software, hardware, and specifications when available. 

Sources
-------------------------------------
The project sources can be found in the srcs directory. Each sub-project will have it's own directory wherein the source code related to that project and any project files are stored. SVN like folders such as trunk, branch, and tag have been removed in favor of git constructs that do not complicate the repo in the way svn does. Tagging is also much cleaner in git.

Currently the srcs folder has the following projects:
> + MyEasyVeep

Documents
------------------------------------
Documents will be stored in the docs folder.
Currently the docs folder has:
> + hw ( Hardware Information )
> + Development\_Log (notes taken while developing software)


