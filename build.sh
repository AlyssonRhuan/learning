echo "Start build"
sh generateReadme.sh
git add .
git commit -m "Last update on $(date)"
git push origin main