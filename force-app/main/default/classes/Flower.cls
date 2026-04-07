//demo with flowerMaker.apex

public with sharing class Flower {
	
    public integer petalCount;
	public string variety;

	public Flower (Integer petals, string variety) {
		this.petalCount = petals;
		this.variety = variety;
	}

	public void wilt () {
		this.petalCount--; //removes one petal
	}

}