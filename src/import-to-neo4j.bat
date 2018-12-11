cd D:\University\PHDResearch\Dev\r\name-matching-graph-gen\out

D:\Softwares\Developement\1-DATABASES\Neo4j\neo4j-community-3.2.3\bin\neo4j-import.bat --into names.db --id-type INTEGER --nodes node_list.csv --relationships edge_list.csv --skip-duplicate-nodes --skip-bad-relationships --stacktrace true --bad-tolerance 1000000 --delimiter "\t" 


D:\University\PHDResearch\Dev\r\name-matching-graph-gen\out\names.db