import os, re, csv

# regular expressions for capturing the interesting quantities
layers_pattern = '^layers: (\d+)$'
noise_pattern = '^noise: ([0-9.]+)$'
res_pattern = '^([0-9.]+$)'

search_dir = "output"
results_file = '../results.csv'

os.chdir( search_dir )
files = filter( os.path.isfile, os.listdir( '.' ))
#files = [ os.path.join( search_dir, f ) for f in files ] # add path to each file
files.sort( key=lambda x: os.path.getmtime( x ))

results = []

for file in files:
	f = open( file )
	contents = f.read()
	
	# layers
	matches = re.search( layers_pattern, contents, re.M )
	try:
		layers = matches.group( 1 )
	except AttributeError:
		print "layers error 1: %s" % ( contents )
		continue
		
	# noise
	matches = re.search( noise_pattern, contents, re.M )
	try:
		noise = matches.group( 1 )
	except AttributeError:
		print "noise error 1: %s" % ( contents )
		continue		
	
	# rmse
	matches = re.search( res_pattern, contents, re.M )
	try:
		res = matches.group( 1 )
	except AttributeError:
		print "matches error 2: %s" % ( contents )
		continue
		
	results.append(( res, layers, noise ))
	
writer = csv.writer( open( results_file, 'wb' ))
for result in results:
	writer.writerow( result )