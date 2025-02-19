package javaProj;

import java.util.Scanner;

public class Assignment4_c0930321 {

	public static void main(String[] args) {
		// Question 1: Test if an array contains a specific value
		System.out.println("Question 1");
		System.out.println("-----------------------------");
		String[] foods = new String[6];
		Scanner userInput = new Scanner(System.in);
		System.out.println("Enter your favourite food items: ");
		
		for(int c = 0; c < foods.length; ) {
			System.out.println("Item " + (c + 1) + "=> ");
			String item = userInput.nextLine().trim();
			if(item.isEmpty()) {
				System.out.println("Invalid input. Please enter non-empty value");
			} else {
				foods[c] = item;
				c++;
			}
		}
		
		System.out.println("Your entered food items:");
		System.out.print("[");
		for(int d = 0; d< foods.length; d++) {
			System.out.print(foods[d] + ", ");
		}
		System.out.print("]\n");
		
		System.out.println("\nEnter a food item to search for in the list:");
        String foodItemToSearch = userInput.nextLine().trim();
        if (!foodItemToSearch.isEmpty()) {
            boolean isFoodFound = foodItemSearch(foods, foodItemToSearch);
            if (isFoodFound) {
                System.out.println("The list contains the food item: " + foodItemToSearch);
            } else {
                System.out.println("The list does not contain the food item: " + foodItemToSearch);
            }
        } else {
            System.out.println("Invalid input. Please enter a non-empty food item to search.");
        }
        System.out.println("\n");
            
		
        
		// Question 2: Find the maximum and minimum value of an array
		System.out.println("Question 2: Finding maximum and minimum values of an array");
		System.out.println("-----------------------------");
		int[] arrayNums = new int[10];
		System.out.println("Enter 10 integer values");
		int arrayLength = arrayNums.length;
		
//		getting array input from user
		Scanner input = new Scanner(System.in);
		for(int i = 0; i < arrayLength; ) {
			System.out.println("Enter a number " + (i+1)+ "=> ");
			if(input.hasNextInt()) {
				arrayNums[i] = input.nextInt();
				i++;
			} else {
				System.out.println("Invalid input. Please enter integer numbers!");
				input.next();
			}
		}
//		displaying the user entered array
		System.out.print("[");
		for(int j = 0; j < arrayLength; j++) {
			System.out.print(arrayNums[j] + ", ");
		}
		System.out.print("]\n");
		int minValue = arrayNums[0];
		int maxValue = arrayNums[0];
		
//		logic to check the minValue and maxValue in array
		for(int k = 0; k < arrayLength; k++) {
			if(arrayNums[k] < minValue) {
				minValue = arrayNums[k];
			}
			if(arrayNums[k] > maxValue) {
				maxValue = arrayNums[k];
			}
		}
		
		System.out.println("Maximum value in above array: " + maxValue);
		System.out.println("Minimum value in above array: " + minValue);
		
		
		
		// Question 3: Copy one array into other
		System.out.println("\nQuestion 3: Copying one array into another");
		System.out.println("-----------------------------");
		
//		shallow copying=> copies the references to the same objects
		System.out.println("******* SHALLOW COPY *******");
		int[] array1 = {4, 8, 7, 2, 3};
		int[] array2 = array1;
		array2[0] = 100;
		
//		print original array
		System.out.println("Original array (Array 1):");
		for(int l=0; l <array1.length; l++) {
			System.out.print(array1[l] + " ");
		}
		System.out.println("\n");
		
//		print copied array
		System.out.println("Copied array (Array 2):");
		for(int value : array2) {
			System.out.print(value + " ");
		}
		
//		deep copying=> new instance of array that is independent of the original array is created
		System.out.println("\n******* DEEP COPY *******");
		int[] array3 = new int[array1.length];
		
//		using loop to deep copy
		for(int n=0; n < array1.length; n++) {
			array3[n] = array1[n];
		}
		
		array3[0] = 99;
		System.out.println("Deep Copied array (Array 3):");
		for(int value : array3) {
			System.out.print(value + " ");
		}
		
	}
	
//	function to search the food item in an array
    public static boolean foodItemSearch(String[] foods, String foodItem) {
    	for(int i = 0; i < foods.length; i++) {
    		if(foods[i].equalsIgnoreCase(foodItem)) {
    			return true;
    		}
    	}
    	return false;
    }

}
