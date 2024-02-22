
export interface Model {
  id: number;
  warband_id: number;
  image: string;
  name: string;
  mini_id: number | null;
  creature_id: string | null;
  leader: string | null;
  second: string | null;
  rating: string | null;
  size: string | null;
  species: string | null;
  base: string | null;
  cost: string | null;
  m: string | null;
  s: string | null;
  b: string | null;
  r: string | null;
  n: string | null;
  c: string | null;
  a: string | null;
  f: string | null;
  p: string | null;
  inate_skills: Array<string> | null;
  weapon_one_id: string | null;
  weapon_one_description: string | null;
  weapon_one_cost: string | null;
  weapon_one_action: string | null;
  weapon_two_id: string | null;
  weapon_two_description: string | null;
  weapon_two_cost: string | null;
  weapon_two_action: string | null;
  armour_one_id: string | null;
  armour_one_description: string | null;
  armour_one_cost: string | null;
  armour_one_action: string | null;
  armour_two_id: string | null;
  armour_two_description: string | null;
  armour_two_cost: string | null;
  armour_two_action: string | null;
  item_id: string | null;
  item_description: string | null;
  item_cost: string | null;
  item_action: string | null;
  special_id: string | null;
  special_description: string | null;
  special_cost: string | null;
  special_action: string | null;
  skills: string | null;
  total_cost: string | null;
  activatedState?: string | null;
}