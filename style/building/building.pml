//===================================================
//  PML file for Blender-OSM
//  Styles for "Place of worship" tag buildings
//===================================================
@name "place of worship";

@meta {
	buildingUse: cathedral;
	classifyFacades: 0;
}

footprint {
	height: attr("height");
	minHeight: attr("min_height");
	numLevels: 2;
	topHeight: 0.;
	roofShape: attr("roof:shape") | flat;
	roofHeight: attr("roof:height");
	roofOrientation: attr("roof:orientation");
	buildingPart: attr("building:part");
	claddingMaterial: per_building(
		attr("building:material") | brick
	);
	claddingColor: goldenrod;
}

//Cube -- main volume
facade 
[item.footprint["buildingPart"] == "cube"]
{
	markup: [
                level{
                    claddingColor: yellow;
                    indices : (1, 1);
                }
                level{
                    claddingColor: red;
                    indices : (0, 0);
                }
                
               ]
}

//refectory
facade 
[item.footprint["buildingPart"] == "refectory"]
{
	claddingColor: green;
}

// porch
facade 
[item.footprint["buildingPart"] == "porch"]
{
	claddingColor: blue;
}

// belltower
facade 
[item.footprint["buildingPart"] == "belltower"]
{
	claddingColor: blue;
}

//apse
facade 
[item.footprint["buildingPart"] == "apse"]
{
	claddingColor: blue;
}

facade[item.footprint["buildingPart"] == "tholobate"] {
	class: tholobate;
	//claddingColor: yellow;
}

//Unknown facade
facade 
{
//absolutely nothing
}


roof {
	roofCladdingMaterial: attr("roof:material") | metal;
	roofCladdingColor:
		attr("roof:colour")
		|
		// roofCladdingMaterial == "metal"
		random_weighted(
            (#afafaf, 1),
            (#b2b2a6, 1),
            (#c8c2b6, 1)
		)
	;
	faces: if (item.footprint["roofShape"] in ("dome", "onion")) smooth;
}


