[ -e newCatalog.yaml ] && rm newCatalog.yaml
          touch newCatalog.yaml
while IFS= read line
	do
		if [ -n "$(echo "$line" | grep 'main')" ]
		then
	  	printf '%s\n' "${line}" >> newCatalog.yaml
	  	printf '%s\n' "    documentation: "  >> newCatalog.yaml
	  	printf '%s\n' "      home: NodeJsAPI/Customer/home.md"  >> newCatalog.yaml
	  	printf '%s\n' "      summary: NodeJsAPI/Customer/summary.md"  >> newCatalog.yaml
	  	printf '%s\n' "    tags:"  >> newCatalog.yaml
	  	printf '%s\n' "      - NodeJS"  >> newCatalog.yaml
	  	printf '%s\n' "      - Flex Proxy"  >> newCatalog.yaml
	  	printf '%s\n' "      - Rate-limiting"  >> newCatalog.yaml

	  else
	  	printf '%s\n' "${line}" >> newCatalog.yaml
	  fi
	  
	done < catalog.yaml
	
	cat newCatalog.yaml