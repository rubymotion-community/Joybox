#!/usr/bin/env python

u"""
    Upscales a Tiled TMX map for use with a retina display. 
    
    Fixes tile size, object position and size, image size.
    Saves the retina file as filename-hd.tmx in the same folder as the source file.
    
    """

__author__ = u'Chrx @ 2011-11-27'

import os
import sys
import fnmatch
from xml.dom.minidom import parse
from os.path import abspath, dirname, splitext, basename, exists

def scale(v):
	return str(v*2)

def processMap(map):
	tilewidth = int(map.getAttribute('tilewidth'))
	tileheight = int(map.getAttribute('tileheight'))
	sys.stdout.write("Map with tile size (%d, %d)\n" % (tilewidth, tileheight))
	
	map.setAttribute("tilewidth", scale(tilewidth))
	map.setAttribute("tileheight", scale(tileheight))
	
	for tileset in map.getElementsByTagName("tileset"):
		processTileset(tileset)
    
	for objectgroup in map.getElementsByTagName("objectgroup"):
		name = objectgroup.getAttribute('name')
		sys.stdout.write("Object group '%s'" % (name)),
		for o in objectgroup.getElementsByTagName("object"):
			processObject(o)
		sys.stdout.write("\n")

def processTileset(tileset):
	tilewidth = int(tileset.getAttribute('tilewidth'))
	tileheight = int(tileset.getAttribute('tileheight'))
	name = tileset.getAttribute('name')
	sys.stdout.write("Tileset '%s' with tile size (%d, %d)\n" % (name, tilewidth, tileheight))
	tileset.setAttribute("tilewidth", scale(tilewidth))
	tileset.setAttribute("tileheight", scale(tileheight))
	
	for image in tileset.getElementsByTagName("image"):
		processImage(image)	

def processImage(image):
	width = int(image.getAttribute('width'))
	height = int(image.getAttribute('height'))
	source = image.getAttribute('source')
	sys.stdout.write("Image '%s' with width %d and height %d\n" % (source, width, height))
	image.setAttribute("width", scale(width))
	image.setAttribute("height", scale(height))

def processObject(o):
	x = int(o.getAttribute('x'))
	y = int(o.getAttribute('y'))
	
	if o.hasAttribute('width'):
		width = int(o.getAttribute('width'))
	else:
		width = 0;
    
	if o.hasAttribute('height'):
		height = int(o.getAttribute('height'))
	else:
		height = 0;
    
	sys.stdout.write("."),
	
	o.setAttribute("x", scale(x))
	o.setAttribute("y", scale(y))
	if width > 0: o.setAttribute("width", scale(width))
	if height > 0: o.setAttribute("height", scale(height))

sourcePath = os.getcwd()
for sourceFile in os.listdir(sourcePath):
	if fnmatch.fnmatch(sourceFile, '*.tmx'):
		if not fnmatch.fnmatch(sourceFile, '*-hd.tmx'):
			targetFile = splitext(sourceFile)[0] + '-hd.tmx'
			sys.stdout.write("Retinafying %s to %s\n\n" % (basename(sourceFile), basename(targetFile)))
            
			if exists(targetFile):
				sys.stdout.write("Removing %s\n" % basename(targetFile))
            
			dom = parse(sourceFile)
            
			assert dom.documentElement.tagName == "map"	
			map = dom.documentElement
            
			processMap(map)
            
			with open(targetFile, 'w') as outputfile:
				dom.writexml(outputfile)
