version=$(cat $csproj | sed -ne '/Version/{s/.*<Version>\(.*\)<\/Version>.*/\1/p;q;}')
oldVersion="<Version>$version</Version>"
newVersion="<Version>$(semver -i $level $version)</Version>"
sed -i "s|$oldVersion|$newVersion|" $csproj
