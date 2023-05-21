You need 3 scripts for this to work by default.

CORE_JOB_LUMBERJACK
CORE_JOB_CRAFTINGMENU
CORE_MARKERMENU

FRAMEWORK

Go to CORE_JOB_CRAFTINGMENU config and change it to your framework | cfg.framework = "esx" ...
Go to CORE_JOB_LUMBERJACK and change it to your framework | cfg.framework = "esx" ...

Images

All the images are in the CORE_JOB_CRAFTINGMENU resource, in the html/icons folder.

Items

ESX

INSERT INTO items (name, label, weight, rare, can_remove) VALUES
('wood_raw', 'Raw Wood', 1, 0, 1),
('wood_processed', 'Processed Wood', 1, 0, 1),
('weapon_melee_hatchet', 'Hatchet', 1, 0, 1),

--QBCORE

['wood_raw'] = {['name'] = 'wood_raw',['label'] = 'Raw Wood',['weight'] = 0,['type'] = 'item',['image'] = 'wood_raw.png',['unique'] = false,['useable'] = false,['shouldClose'] = false,['combinable'] = nil,['description'] = 'Raw Wood, choped from a tree'},
['wood_processed'] = {['name'] = 'wood_processed',['label'] = 'Processed Wood',['weight'] = 0,['type'] = 'item',['image'] = 'wood_processed.png',['unique'] = false,['useable'] = false,['shouldClose'] = false,['combinable'] = nil,['description'] = 'Processed Wood, processed from raw wood.'},
['weapon_melee_hatchet'] = {['name'] = 'weapon_melee_hatchet',['label'] = 'Hatchet',['weight'] = 0,['type'] = 'weapon',['ammotype'] = nil,['image'] = 'weapon_melee_hatchet.png',['unique'] = true,['useable'] = false,['description'] = 'An Hatchet'},

vRP & vRPEX

['wood_raw'] = {'Raw Wood', 'Raw Wood, choped from a tree.', nil, 1},
['wood_processed'] = {'Processed Wood', 'Processed Wood, processed from raw wood.', nil, 1},
['weapon_melee_hatchet'] = {'Hatchet', 'An Hatchet.', nil, 1},