@IsTest
private class IngredientTriggerHandler_Test {
    @IsTest
    private static void testFlagNonDraftRecipe() {
        // when a new ingredient is added, non-draft recipes should be flagged for review.

        List<Recipe__c> recipes = new List<Recipe__c>();
        // create recipe that is not a draft
        Recipe__c rec1 = new Recipe__c();
        rec1.Name = 'Test Recipe 1';
        recipes.add(rec1);
        //create recipe that is a draft
        Recipe__c rec2 = new Recipe__c();
        rec2.Name = 'Test Recipe 2';
        rec2.Draft__c = true;
        recipes.add(rec2);
        insert recipes;

        // create ingredient
        List<Ingredient__c> ingredients = new List<Ingredient__c>();
        Ingredient__c ing1 = new Ingredient__c();
        ing1.Recipe__c = rec1.Id;
        ing1.Name = 'Ingredient1Name';
        ingredients.add(ing1);
        Ingredient__c ing2 = new Ingredient__c();
        ing2.Recipe__c = rec2.Id;
        ing2.Name = 'Ingredient2Name';
        ingredients.add(ing2);
        insert ingredients;

        // validate that the recipe is now marked as needs review
        List<Recipe__c> updatedRecipes = [
            SELECT ID, Needs_Review__c
            FROM Recipe__c
            WHERE Needs_Review__c = true
        ];

        Assert.areEqual(1, updatedRecipes.size(), 'Only the nondraft recipe should Need Review');
    }

    @IsTest
    private static void testCheckForAllergens(){
        //insert 2 recipes with Contains_Allergens__c = false

        //insert an ingredient that is a known allergen (e.g. 'Wheat'), and one that is not (to different recipe)

        //validate that the correct recipe is now marked as Contains_Allergens__c = true, and the second recipe is not changed.
    }

    @IsTest
    private static void testDupeChecker() {
        // 1. Data Setup
        // create recipe
        Recipe__c rec = new Recipe__c();
        rec.Name = 'Test Recipe 1';
        insert rec;

        // create ingredient
        Ingredient__c ing = new Ingredient__c();
        ing.Recipe__c = rec.Id;
        ing.Name = 'IngredientName';
        insert ing;

        // Attempt to create a duplicate ingredient and verify an error is shown
        Ingredient__c dupeIng = new Ingredient__c();
        dupeIng.Recipe__c = rec.Id;
        dupeIng.Name = 'IngredientName';

        // Run the Test
        Test.startTest();

        try {
            insert dupeIng;
            System.assert(false, 'Exception expected');
        } catch (Exception e) {
            // Did we get the expected error?
            Assert.areEqual(e.getTypeName(), 'System.DmlException', 'Expected DML Exception');
        }

        Test.stopTest();
    }
}
