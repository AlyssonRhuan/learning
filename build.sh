echo "Start build"
sh generateReadme.sh
git add .
git commit -m "Update at $(date)"
git push origin main