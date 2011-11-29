<?php
class IMAGE_CLASS
{
	private $archive;
	private $image;
	private $dimensions;
	
	function __construct($archive)
	{
		$this->archive = $archive;
		$this->image = imagecreatefromjpeg($archive);
		$this->dimensions = getimagesize($archive);
		
	}
	public function image_original()
	{
		header("Content-Type: image/jpeg");
		imagejpeg($this->image);
		
	}
	public function image_thumbnail()
	{
		$dimensionX = $this->dimensions[0] / 3;
		$dimensionY = $this->dimensions[1] / 3;
		$this->thumbnail = imagecreatetruecolor($dimensionX,$dimensionY);
		imagecopyresampled($this->thumbnail, $this->image, 0, 0, 0, 0, $dimensionX, $dimensionY, $this->dimensions[0], $this->dimensions[1]);
		header("Content-Type: image/jpeg");
		imagejpeg($this->thumbnail);
	}
	
}

$fotografia = new IMAGE_CLASS($_GET["fotografia"]);
if($_GET["modo"] == "original") 
{
	$fotografia->image_original();
} else 
{
	$fotografia->image_thumbnail();
}
?>