import { Category } from '../types/listing';
import { CO2_PER_ITEM_KG } from '../config/constants';

export function calculateCO2Saved(category: Category): number {
  return CO2_PER_ITEM_KG[category] || 5;
}

export function estimateRetailPrice(category: Category): number {
  const estimates: Record<Category, number> = {
    electronics: 150,
    books: 50,
    clothing: 40,
    dorm_stuff: 80,
    utilities: 25,
    sports: 60,
    tickets: 30,
    other: 30,
  };
  return estimates[category] || 30;
}

export function calculateMoneySaved(
  listingPrice: number,
  category: Category
): number {
  const retail = estimateRetailPrice(category);
  return Math.max(0, retail - listingPrice);
}
