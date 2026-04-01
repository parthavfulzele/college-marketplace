import { Category, Condition } from '../types/listing';
import { BadgeType } from '../types/user';

export const CATEGORIES: { key: Category; label: string; icon: string }[] = [
  { key: 'electronics', label: 'Electronics', icon: 'laptop' },
  { key: 'books', label: 'Books', icon: 'book-open' },
  { key: 'clothing', label: 'Clothing', icon: 'shirt' },
  { key: 'dorm_stuff', label: 'Dorm Stuff', icon: 'bed' },
  { key: 'utilities', label: 'Utilities', icon: 'tool' },
  { key: 'sports', label: 'Sports', icon: 'activity' },
  { key: 'tickets', label: 'Tickets', icon: 'ticket' },
  { key: 'other', label: 'Other', icon: 'more-horizontal' },
];

export const CONDITIONS: { key: Condition; label: string }[] = [
  { key: 'new', label: 'New' },
  { key: 'like_new', label: 'Like New' },
  { key: 'good', label: 'Good' },
  { key: 'fair', label: 'Fair' },
];

export const BADGE_DEFINITIONS: Record<BadgeType, { label: string; icon: string; description: string }> = {
  fast_responder: {
    label: 'Fast Responder',
    icon: 'zap',
    description: 'Replies within 1 hour',
  },
  five_star: {
    label: '5-Star Seller',
    icon: 'star',
    description: 'Average rating of 5.0',
  },
  generous_donor: {
    label: 'Generous Donor',
    icon: 'heart',
    description: 'Donated 5+ items',
  },
  new_seller: {
    label: 'New Seller',
    icon: 'sparkles',
    description: 'Just joined the marketplace',
  },
};

export const MAX_LISTING_IMAGES = 5;
export const MAX_TITLE_LENGTH = 100;
export const MAX_DESCRIPTION_LENGTH = 1000;
export const MAX_PRICE = 10000;
export const LISTINGS_PAGE_SIZE = 20;

export const CO2_PER_ITEM_KG: Record<Category, number> = {
  electronics: 15,
  books: 2,
  clothing: 5,
  dorm_stuff: 20,
  utilities: 3,
  sports: 8,
  tickets: 0,
  other: 5,
};
