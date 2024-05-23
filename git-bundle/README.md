# Post-Export/Import project diff migration
In order to allow dev teams to continue working after their projects are migrated to air-gapped environment, the below process will be used in order to migrate updates in projects without having to move the entire code base again. This will help dev teams to between air-gapped environments requiring minimal effort and maintain clean record of commits.
<br><br>
This process uses git bundle to collect relevant commits for transfer.

### Create bundle (manually)

#### Step 1: Clone git repository from GitLab

```bash
git clone $REPO
```

#### Step 2: Create bundle
- if you want everything use the `--all` parameter
- to bundle a specific range of commits use `$start_commit_hash..$end_commit_hash`
- to bundle from a commit to current use `$start_commit_hash..HEAD`
- to bundle using tags a reference use `$tag..HEAD`

```bash
reponame=myrepo 
filename=/opt/backups/git-${reponame}-$(date +%Y-%m-%d:%H:%M:%S).bundle

git bundle create "$filename" --all 

# OR if via tag

tag = last-bundle 
git bundle create "$filename" $tag..HEAD
```

### Transfer Process (manual)

#### Step 1:
Download bundle

#### Step 2: 
manually upload to air-gapped environment


### Air-gapped Environment
On the air-gapped environmet (assuming the project/repo already exists):
Assumptions would be to create a transfer branch to pull in bundle and then create a merge request with whatever branch.

#### Step 1: Pull destination git repo

```bash
git pull $destination_repo
```

#### Step 2: create new branch and switch to it

```bash
git switch -c bundle-transfer
#OR
git checkout -b bundle-transfer
```

#### Step 3: Pull bundle into new branch

```bash
git pull $bundle
```

#### Step 4: Push to Git remote repo
this will create the new branch on remote repo (github, gitlab, etc)

``` bash
git push --set-upstream origin bundle-transfer
```

#### Step 5:
Create merge request and address any merge conflicts.


---
### Resources:
- https://git-scm.com/docs/git-bundle 
- http://juanmanueldehoyos.com/synchronize-git-repositories-offline-with-bundle/
- https://redmine.dicelab.net/projects/instructibels/wiki/Synchronizing_Git_Repos_Across_Disconnected_Networks
- https://www.perforce.com/blog/vcs/git-beyond-basics-git-bundle-and-archive
- https://www.tutorialandexample.com/git-bundle/
- https://stackoverflow.com/questions/3965676/why-did-my-git-repo-enter-a-detached-head-state 

