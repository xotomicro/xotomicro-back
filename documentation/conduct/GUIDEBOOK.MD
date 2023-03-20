# GUIDEBOOK

> ☀️ RULES FOR THE REPO - A DEVELOPERS GUIDEBOOK

### TICKETS 🎟

please start with a ticket from our ticket platform and make sure to
name your branch accordingly with the ticket number

--------------------------------------------

### GITLAB 🚀

#### GITLAB SYSEM

Push your branch to the repo as soon as you can upon creation - as a merge request. with the following tags at the start of your commit we will get to know what is ready to push to the master branch

- DRAFT : WHEN YOU ARE ON YOUR Final Draft<br>
- MERGE : WHEN YOU ARE READY TO PUSH<br>

#### COMMIT EXAMPLE

- [DRAFT] : making changes to modal close button
- [MERGE] : Ready to merge modal feature

#### ROLES

- MANAGEMENT : ABILITIES :
  - Is able to push from development branch to production  
  - Has all developers rights
  - Can create branches that doesn't require ticket number : though not recommended
  - can assign a developer to change roles

- DEVELOPERS : ABILITIES
  - push to develop branch
  - create new tickets
  - thumbs up to other PRs

--------------------------------------------

### REPO BRANCHES ♻️

#### BRANCHES NAMING CONVENTION

- feat : Features we want to add
- bug : BUGS to fix
- style : Styles we want to add
- docs : Documentation to add
- ops : Dev Ops Operations
- test : tests that we want to create
- review : Review based work todo (can add fixes)
- refactor : Refactors to be made

#### FINAL BRANCH EXAMPLE

- example: {feat|style|refactor|doc}/{name}/{TICKET#}/{doing}
- ie: feat/stan/XOTO-32322/styling-navbar

> NOTES:

- for branches please use lowercases and "-" rather than "_" for spaces
- for management roles - you can create a branched that resembles : feat/stan/xoto-manage/fix-todos as a name
- if tickets are too small we can always group tickets together and rename branch to : feat/stan/xoto-32322+32827+2377/styling-navbar

--------------------------------------------

### WORK FLOW

0. Start CLOCKIFY
1. You start a pr in draft and push
2. You code magic !!!  
3. Push commits every once in a while
4. End of the day / time you check it all works well
5. You push one more time
6. Remove [DRAFT]
7. End CLOCKIFY
8. You remove draft
9. Management check at the end of my day
10. Management push all changes
12. New day, new pr ^^

--------------------------------------------

### PULL REQUEST PROCESS

1. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
2. You may merge the Pull Request in once you have the sign-off of two other developers, or if you do not have permission to do that, you may request the second reviewer to merge it for you. as long as you have two thumbs up 👍
3. Update the"CHANGELOG.md" with details of changes to the interface, this includes new environment variables, exposed ports, useful file locations and container parameters.

--------------------------------------------

### CLOCKIFY or TIME CLOCK ⏰

Sign up for CLOCKIFY or the projects choice and add in your time when starting to work

- make sure to say when you start and when you end as a notification on our chat platform

--------------------------------------------

### TODOS ✅

Tags for the todos in our communication platform are : <br>

- you can do a global search to this through the project and take care of one at a time :

| @low                         | @high           | @highest      |
|------------------------------|-----------------|---------------|
| not priority/still important | to take care of | to priorities |

--------------------------------------------

### INFO TODO TAGS AND COMMENTS 📒

Tags for the info and comments are :

| todo : @info          | todo :  @comment      |
|-----------------------|-----------------------|
| information to detail | to add JS comments to |
