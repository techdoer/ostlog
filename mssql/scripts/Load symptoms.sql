﻿--
-- Version: A script to pre-populate the Symptoms dimension table with a standard list of symptoms.   Designed for Azure SQL Server. 
-- URL:         -
--
INSERT [dbo].[SymptomsRimini] (id, sname, classification, remarks)
VALUES (1,'Chills','General',''),
(2,'Fever','General','Includes: Fever, High temperature'),
(4,'Fatigue','General','Includes: Exhausted, General weakness, Pooped, Rundown, Tired, Worn out'),
(5,'General ill-feeling','General','Includes: Not feeling weell'),
(7,'Fluid imbalance','General','Includes: Dehydration, Excessive sweating, Excessive thirst, Retention of fluid'),
(9,'Lack of phsiological development','General','Includes: Lack of growth'),
(10,'Weight gain','General','Includes: Obesity'),
(11,'Weight loss','General','Includes: Recent weight loss, Underweight'),
(13,'Pain, generalized, site unspecified','General','Includes: Ache, Aches all over, Cramp, Hurt, Stiffness'),
(15,'Swelling or mass, site unspecified','General','Includes: Bulge, Bump, Knot, Lump'),
(20,'General symptoms of infants and children','General','Includes: Crying too much, Fidgety, Fussy, Hyperactive, Irritable, Underactive'),
(50,'Abnormal involuntary movements','Nervous System','Includes: Shaking, Tic, Tremor, Twitch; Excludes: Eyes'),
(52,'Coma and stupor','Nervous System', ''),
(53,'Confusion','Nervous System', ''),
(54,'Convulsions','Nervous System','Includes: Fits, Seizures, Spells; Excludes: Fainting'),
(56,'Headache','Nervous System','Includes: Migraine, Nervous, Tension'),
(58,'Memory, disturbances of','Nervous System','Includes: Amnesia, Lack or loss of memory, Temporary loss of Memory'),
(59,'Other disturbances of sensation','Nervous System','Includes: Anesthesia, Burning, Hypersthesia, Loss of sense of smell/taste/touch, Prickly feeling, Tingling'),
(62,'Disturbances of sleep','Nervous System','Includes: Drowsiness, Hypersomnia, Insomnia, Trouble sleeping, Can''t sleep, Nightmares, Sleepiness, Sleep walking, Time-zone syndrome'),
(65,'Senility-Old Age','Nervous System', ''),
(67,'Stammering or stuttering','Nervous System', ''),
(69,'Vertigo-dizziness','Nervous System','Includes: Falling sensation, Giddiness, Lightheadedness, Loss of sense of equilibrium or balance'),
(70,'Other symptoms referable to the nervous system','Nervous System', ''),
(100,'Acne or pimples','Skin, Nails, and Hair','Includes: Bad complexion, blackheads, blemishes, breaking out, whiteheads'),
(104,'Discoloration or pigmentation','Skin, Nails, and Hair','Includes: Bluishing, color chain in, flushing, freckles, red, spots'),
(106,'Infectious disorders','Skin, Nails, and Hair','Includes: Athlete''s foot, Boils, Ringworm,'),
(108,'Caluses or corns','Skin, Nails, and Hair', ''),
(109,'Skin moles','Skin, Nails, and Hair', ''),
(110,'Wrinkles','Skin, Nails, and Hair', ''),
(111,'Warts','Skin, Nails, and Hair', ''),
(112,'Alergic skin reactions','Skin, Nails, and Hair','Includes: Hives, Photosensitivity, Poison ivy - poison oak, Rash, diaper'),
(113,'Skin irritations','Skin, Nails, and Hair','Includes: Inflammation, Itching, Pain, Ulcer, Sore'),
(115,'Swelling or mass of skin','Skin, Nails, and Hair','Includes: Bumps, Lesion, Nodules, Welts - except hives'),
(116,'Wound of skin','Skin, Nails, and Hair','Includes: Bites, Blisters - non-allergic, Bruises, Burns - chemical/sun/wind/steam, Cuts, Scratches'),
(120,'Other specific symptoms skin','Skin, Nails, and Hair','Includes: Dryness, Oiliness, Peeling, Scaliness, Texture - change in'),
(122,'Other specific symptoms nails','Skin, Nails, and Hair','Includes: Breaking, Brittle, Color - change in, Cracked, Ingrown, Ridges, Splitting'),
(124,'Symptoms referable to hair','Skin, Nails, and Hair','Includes: Baldness, Brittle, Dryness, Falling out, Oiliness, Receding hair line'),
(126,'Symptoms of umbilicus','Skin, Nails, and Hair','Includes: Discharge, Draiing, Not healing, Painful, Red'),
(130,'Other symtpoms','Skin, Nails, and Hair', ''),
(200,'Irregular pulsations and palpitations','Cardiovascular and Lymphatic Systems','Includes: Descreased, Fluttering, Increased, Pulse too fast, Pulse too slow, Other irregular heart beats, Rapid heart, skipped beat, Unequal'),
(201,'Heart murmur','Cardiovascular and Lymphatic Systems', ''),
(205,'Abnormally high blood pressure','Cardiovascular and Lymphatic Systems','Includes: Elevated B/P, High B/P, Hypertension'),
(206,'Abnormally low blood pressure','Cardiovascular and Lymphatic Systems','Includes: Decreased B/P, Hypotension, Low B/P'),
(210,'Symptoms referable to blood','Cardiovascular and Lymphatic Systems','Includes: Poor, Think, Tired, Weak'),
(212,'Pallor and cyanosis','Cardiovascular and Lymphatic Systems','Includes: Ashen color, Blueness of fingers-toes, Paleness'),
(214,'Syncope or collapse','Cardiovascular and Lymphatic Systems','Includes: Blacked out, faining, passed out, spells'),
(216,'Other symptoms of the heart','Cardiovascular and Lymphatic Systems','Includes: Bad heart, Poor heart, weak heart'),
(220,'Other symptoms referable to cardiovascular system','Cardiovascular and Lymphatic Systems', ''),
(231,'Edema and dropsy','Cardiovascular and Lymphatic Systems', ''),
(232,'Swollen lymph glands','Cardiovascular and Lymphatic Systems','Includes: enlarged lymph nodes, sore glands, swollen glands'),
(240,'Other symtoms referable to lymphatic system','Cardiovascular and Lymphatic Systems', ''),
(300,'Nose bleed','Respiratory System','Includes: bleeding from nose, hemorrhage from nose; Excludes: Injury'),
(301,'Nasal congestion','Respiratory System','Includes: Drippy nose, Postnasal drip, Red nose, Runny nose, Sniffles, Stuffy nose'),
(304,'Sinus problems','Respiratory System','Includes: Congestion, Impacted, Infected, Lightness, Pain Pressure'),
(306,'Shortness of breath','Respiratory System','Includes: Breathlessness, Dyspnea, Sensation of suffocating, Trouble Breathing'),
(307,'Other disorders of respiratory rhythm and sound','Respiratory System','Includes: Abnormal breathing sounds, hyperventilation, Rales, Rapid breathign, Sighing respiration, Wheezing'),
(310,'Sneezing','Respiratory System', ''),
(311,'Cough','Respiratory System', ''),
(312,'Cold','Respiratory System', ''),
(313,'Flu','Respiratory System','Includes: Grip, Influenza'),
(314,'Croup','Respiratory System', ''),
(320,'Sputum or phlegm','Respiratory System','Includes: Bloody, Excessive, Purulent'),
(321,'Congestion in chest','Respiratory System','Includes: Lung congestion'),
(322,'Pain in chest','Respiratory System','Includes: Burning sensation, chest tightness, pain in lung, pain over heart, respiratory pain, rib pain, retrosternal pain, sternal pain, side of chest pain, pressure on chest pain'),
(325,'Disorders of voice','Respiratory System','Includes: Hoarseness, Hypernasality'),
(330,'Other symptoms referable to respiratory system','Respiratory System', ''),
(400,'Pain, swelling, injury of lower extremity','Muscoloskeletal System','Includes: Ache, Charleyhorse, Contracture, Cramp, hot-cold, Hurt, Pulled muscle, soreness, Spasm, Stiffness, Strain'),
(405,'Pain, swelling, injury of upper extremity','Muscoloskeletal System','Includes: Ache, Contracture, Cramp, Hot-cold, hurt, Pulled Muscle, Soreness, Spasm, Stiffness, Strain'),
(410,'Pain, swelling, injury of face and neck region','Muscoloskeletal System','Includes: Ache, Contracture, Cramp, Hurt, Pulled muscle'),
(415,'Pain, swelling, injury of back region','Muscoloskeletal System','Includes: Ache, Contracture, Cramp, Hurt, Pulled muscle, Soreness, Spasm, Stiffness, Strain'),
(420,'Atrophy or wasting of extremities','Muscoloskeletal System','Includes: Numbness, Paralysis, partial or complete, Weakness'),
(421,'Difficulty in walking, abnormality of gait','Muscoloskeletal System','Includes: Clumsiness, Falling, Inability to stand or walk, limping, Staggering'),
(422,'Other symptoms referable to limb and joint','Muscoloskeletal System','Includes: foot drop, posture problems, wrist drop'),
(425,'Other and multiple symptoms referable to unspecified limbs, ints or muscles','Muscoloskeletal System','Includes: Ache Contracture, Crmap, Hurt, Pulled muscle, Soreness, Spasm, Stiffness, Strain'),
(429,'Bunion','Muscoloskeletal System', ''),
(430,'Other symptoms referable to the muscoloskeletal system','Muscoloskeletal System', ''),
(500,'Chewing difficulty','Digestive System', ''),
(501,'Bleeding, gums (gingival)','Digestive System', ''),
(502,'Halitosis','Digestive System','Includes: Bad breath'),
(505,'Symptoms referable to lips','Digestive System','Includes: Abnormal color, bleeding, cracked, dry, pain, swelling'),
(510,'Symptoms referable to mouth','Digestive System','Includes: Bad taste, burn, Dryness, Inflammation, Pain, Swelling, Ulcer'),
(511,'Saliva, excess','Digestive System','Includes: Drooling'),
(512,'Toothache','Digestive System', ''),
(515,'Other symptoms referable to mouth','Digestive System', ''),
(520,'Throat soreness','Digestive System','Includes: Painful throat, Scratchy throat, Sore throat'),
(525,'Symptoms referable to tongue','Digestive System','Includes: Abnormal color, Bleeding, blisters, Burned, Pain, ridges, Smooth, Swelling or mass, Ulcer'),
(527,'Symptoms referable to tonsils','Digestive System','Includes: Bleeding (postoperative), Discharge, inflammation, Swelling'),
(528,'Difficulty in swallowing','Digestive System','Includes: Choking'),
(530,'Other symptoms referable to throat','Digestive System', ''),
(540,'Abdominal pain','Digestive System','Includes: Colic, intestinal, pain in epigastrium, pain in illiac, pain in gron, pain in stomach (includes cramps), pain in umbilical region'),
(541,'Colic, infantile','Digestive System', ''),
(542,'Abdominal swelling or mass','Digestive System','Includes: Distention or fullness'),
(543,'Flatulence','Digestive System','Includes: Bloating, gas, Distention due to gas, Gas excessive'),
(545,'Appetite, abnormal','Digestive System','Includes: Decrease, Excessive, Loss'),
(546,'Feeding problems','Digestive System', ''),
(550,'Bleeding, gastrointestinal','Digestive System','Includes: Blood in stools (melena), Hematemesis, Hemorrhage, Vomitting blood'),
(554,'Constipation','Digestive System', ''),
(555,'Diarrhea','Digestive System','Includes: Loose stools'),
(556,'Other symptoms or changes in bowel funcion','Digestive System','Includes: Bulky stools, Dark stools, Fatty stools, Mucous stools, Pus stools, Unusual color, unusual odor'),
(560,'Symptoms referable to anus-rectum','Digestive System','Includes: Bleeding, Itching, Mass, Rectal pain, Swelling'),
(570,'Heartburn or upset stomach','Digestive System','Includes: Belching, Indigestion'),
(572,'Nausea and vomitting','Digestive System','Includes: Retching, Sick to Stomach, Throwing up'),
(574,'Regurgitation or spitting up','Digestive System', ''),
(575,'Hiccough','Digestive System', ''),
(579,'Jaundice','Digestive System', ''),
(580,'Other symptoms of liver, gallblader and biliary tract','Digestive System','Includes: Biliary colic, Gallstones'),
(590,'Other symptoms referable to Digestive System','Digestive System', ''),
(600,'Urine abbnormalities and abnomral constituents','Urinary Tract','Includes: Blood, Pus, Unusual color, Unusual odor; Excludes: Passing stones'),
(601,'Frequency and nocturia','Urinary Tract','Includes: Bed wetting, Night discharge'),
(602,'Incontinence of urine','Urinary Tract','Includes: Dribbling, Involuntary urination'),
(603,'Retention of urine','Urinary Tract','Includes: Cannot empty bladder, inability to urinate'),
(604,'Painful urination','Urinary Tract','Includes: Burning'),
(610,'Other urinary dysfunctions','Urinary Tract','Includes: Hesitancy, Large volume, slowing of stream'),
(620,'Other symptoms referable to the urinary tract','Urinary Tract','Includes: Bladder trouble, passed stones'),
(630,'Infertility','Male Reproductive System','Includes: Low ssperm count, sterility'),
(631,'Pain, swelling, or mass of male genitals','Male Reproductive System','Includes: Pain, sswelling, or mass of the penis'),
(663,'Vulvar disorder','Male Reproductive System','Includes: Perineal swelling or mass, ulcer'),
(665,'Infertility female','Female Reproductive System','Includes: Sterility'),
(667,'Problems of pregnancy','Female Reproductive System','Includes: Leaking amniotic fluid, possible labor, products of conception passed, spotting'),
(670,'Other symptoms referable to female reproductive system','Female Reproductive System', ''),
(680,'Lump or mass of breast','Breast Symptoms','Includes: Bump, hard spot, knot, local swelling, nodule'),
(681,'Pain or soreness of breast','Breast Symptoms','Includes: Redness, Swelling, generalized, Tenderness'),
(683,'Symptoms of nipple','Breast Symptoms','Includes: Bleeding, change in color, discharge, inflammation, inversion'),
(684,'Ppostpartum problems of breast','Breast Symptoms','Includes: Abnormal secretion, Absence of milk, Difficulty or inability in nursing, engorgement, Excessive milk, Improper lactation'),
(690,'Other symptoms referabble to breast','Breast Symptoms','Includes: Sagging'),
(700,'Blindness','Eyes and Ears','Includes: Complete'),
(701,'Other vision dysfunction','Eyes and Ears','Includes: Blurred, Cloudy vision, Diminished, Dull vision, Floaters, Half vision, Hazy vision, Photophbia, Spots'),
(704,'Discharge from eye','Eyes and Ears','Includes: Blood, Excessive tearing, Pus, Watering'),
(705,'Eye pain and irritation','Eyes and Ears','Includes: Burning, Inflamed, Irritation, Itching, Swelling or mass;Excludes: Eyelids'),
(708,'Abnormal eye movements','Eyes and Ears','Includes: Abnormal retraction, Cross-eyed, Pupil unequal, Spasms, Squinting, Twitching'),
(710,'Symptoms of eyelids','Eyes and Ears','Includes: Drooping, Inflammation, Itching, Swelling or mass'),
(711,'Sty','Eyes and Ears', ''),
(712,'Pink-eye','Eyes and Ears','Includes: Conjunctivitis'),
(715,'Foreign body in eye','Eyes and Ears', ''),
(716,'Eye injuries','Eyes and Ears','Includes: Black eye, Burns, Scratches;Excludes: Foreign Body'),
(717,'Abnormal appearance of eye','Eyes and Ears','Includes: Abnormal eye protrusion, Bloodshot, Cloudy, Dull, hazy'),
(720,'Other symptoms referable to eye','Eyes and Ears', ''),
(730,'Deafness','Eyes and Ears', ''),
(731,'Other hearing dysfunctions','Eyes and Ears','Includes: Acute hearing, Diminished hearing, Extraneous noises, Ringing in ears, Trouble hearing'),
(734,'Discharge from ear','Eyes and Ears','Includes: Bleeding'),
(735,'Earache','Eyes and Ears','Includes: Pain in ear'),
(737,'Plugged feeling in ear','Eyes and Ears','Includes: Blocked, Cracking, Popping, Stopped up'),
(738,'Excess wax in ear','Eyes and Ears', ''),
(739,'Abormal ear size','Eyes and Ears', ''),
(740,'Other symptoms referable to ears','Eyes and Ears','Includes: Foreign body in ear, Itching, Swelling or mass'),
(800,'Anxiety','Mental Health','Includes: Apprehension'),
(801,'Fears and phobias','Mental Health', ''),
(805,'Restlessness','Mental Health','Includes: Hyperactivity, Overactivity'),
(806,'Loneliness','Mental Health', ''),
(807,'Depression','Mental Health','Includes: Bitterness, Crying excessively, Dejected, Discontented, Feeling lost, Feeling rejected, Hopelessness, Unhappy, Worrying'),
(810,'Nervouseness','Mental Health','Includes: Butterflies, Nerves, Tension, Upset'),
(815,'Behavioral disturbance','Mental Health','Includes: Antisocial behavior, Behavioral problems, Irritability, Quarrelsome, Temper tantrums'),
(820,'Excessive smoking','Mental Health', ''),
(821,'Alcohol related problems','Mental Health','Includes: Alcoholism, Drinks to much'),
(822,'Abnormal drug use','Mental Health','Includes: Excessive use of stimulants or depressants, misue of medication or drugs'),
(824,'Delusions or hallucinations','Mental Health', ''),
(826,'Bad habits','Mental Health','Includes: Chewing on hair, nail biting, thumb sucking'),
(827,'Obsessions or compulsions','Mental Health', ''),
(828,'Psychosexual disorders','Mental Health','Includes: Frigidity, Homosexuality, Impotence')
GO