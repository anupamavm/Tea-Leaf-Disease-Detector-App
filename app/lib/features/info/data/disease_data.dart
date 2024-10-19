// disease_data.dart
class Disease {
  final String title;
  // final String tagline;
  final String imageUrl;
  final String description;
  final String subdesc;

  Disease({
    required this.title,
    // required this.tagline,
    required this.imageUrl,
    required this.description,
    required this.subdesc,
  });
}

final List<Disease> diseases = [
  Disease(
      title: 'Black Blight',
      // tagline: 'Rhizoctonia solani',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEilrfZdbqr9Qby82xYq_VSakTsbrH7hW9RJ41pfOPtwwY8nCauxgL2iIvK_D_rZDC5EFlK-CrrhH2JnJHDBHzuFfTUkUVhvQN9rfy6insc9e3tbJsqKeC5bYXdj5zx7l0UBeOcP3cioNDFIEh4VCkqH-8JZj8AlZpG8326aIKO9YpcRFAoIBLGh1GLtFo4Y/w320-h320/BlackBlight_22.jpg',
      description: '''
**Description**: Black blight is a fungal disease caused by Rhizoctonia solani, primarily affecting young tea leaves near the soil.
**Symptoms**: It is characterized by irregular black spots on young leaves, especially along the leaf base and mid-rib. Infected leaves become necrotic, die, and may remain attached due to a cobweb-like mycelium. The disease can spread to upper parts of the plant, causing severe defoliation.
**Impact**: Black blight leads to significant leaf loss, reducing photosynthesis and lowering tea yield and quality, which results in economic losses for growers.
**Causes**: The disease favors high humidity, heavy rainfall (20+ inches/month), and limited sunlight (below 150 hours/month). Its spread is more severe during prolonged wet weather.
**Management**: 
- **Cultural**: Pruning, removing infected leaves, and monitoring weather conditions can help control the spread.
- **Chemical**: Copper fungicides (0.25% solution) are effective in managing the disease.
- **Future Trials**: More research is needed to optimize fungicide application timing and frequency for better control.
''',
      subdesc:
          'Black blight, caused by Rhizoctonia solani, leads to irregular black spots on young leaves, resulting in significant leaf loss and reduced tea yield.'),
  Disease(
      title: 'Blister Blight',
      // tagline: 'Exobasidium vexans',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgoo84v5THQvVbwtGsJQvo3F0m7ai3EPCLrdqP0foZ5AtjIk3KJ-c1QYCVs7VXm0z-8tXJZgJ8Ewb8exVKqwny6CpEPQV1NmFs5mX1VrLIlmjb1Mb8wCgv-BCQYRqDyJw7rFRDwqkHWKQs7lqQMdRz3bYhaoZ-7ZslkxQJAFRfZ_GimW-KEwWpxQDtCJeHL/w320-h320/BlisterBlight_31.jpg',
      description: '''
**Description**: Blister blight is a fungal disease caused by Exobasidium vexans, primarily affecting young tea leaves.
**Symptoms**: Small, pinhole-size spots appear on young leaves less than a month old. As the leaves grow, the spots become transparent, larger, and light brown. After about 7 days, blister-like symptoms appear on the lower leaf surface, with dark green, water-soaked zones surrounding the blisters. Once fungal spores are released, the blister turns white and velvety, then eventually brown. Infected young stems become bent, distorted, and may break off or die.
**Impact**: Blister blight reduces the quantity and quality of tea leaves, leading to defoliation and stunted growth of young shoots. It can cause significant yield losses, especially in young plantations and during prolonged wet conditions.
**Causes**: The disease thrives in cool, moist conditions with high humidity, typically during the monsoon season. Spores spread through wind and rain, making densely planted areas more susceptible.
**Management**: 
- **Cultural**: Pruning improves air circulation, reducing humidity around the plants.
- **Chemical**: Systemic fungicides like hexaconazole or copper-based fungicides help control the spread.
- **Timing**: Fungicides should be applied before the onset of the monsoon season to prevent infections.
''',
      subdesc:
          'Blister blight affects young tea leaves, causing blisters that lead to defoliation and significant yield losses, especially in wet conditions.'),
  
  
  Disease(
      title: 'Brown Blight',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjyEGqRo8aKBzvF5o1AYrSg63FHQamKvHIT_tuI6jrn9hMBhcusatGCzdYkT07MdH9aqfp1NGT6kg_6n785XLIlT5RiYOG4nJO0ktaNdQ5QZ0bwrpjWPfLjZi0pDToIr7jjvkh13wjOzgnckMU82qmsPKvkX_sqz_sLgjOhGVLLhDLD-KlkxGP2CsVNK1SN/w320-h320/BrownBlight_57.jpg',
      description: '''
**Description**: Brown blight is a fungal disease caused primarily by Colletotrichum species, affecting tea leaves and young shoots.
**Symptoms**: Initial symptoms include water-soaked lesions on young leaves. As the disease progresses, these lesions expand and turn dark brown or black, often covered with black acervuli, which are spore-producing structures of the fungus. Affected leaves may die and fall, while tender branches can experience dieback. Severe infections lead to extensive defoliation, impacting the overall health of the tea plant.
**Impact**: Brown blight can significantly reduce tea production and degrade leaf quality, leading to a lower market value for the tea.
**Causes**: The disease thrives in conditions of high humidity (over 95%), temperatures ranging from 25 to 30°C, and areas with poor air circulation, especially during the rainy season.
**Management**: 
- **Cultural Practices**: Improve soil drainage, maintain proper spacing between plants, and practice crop rotation to reduce humidity levels.
- **Chemical Control**: Fungicides such as mancozeb or copper-based fungicides are effective in managing outbreaks.
- **Timely Application**: To prevent the spread of the disease, fungicides should be applied at the first signs of symptoms and before the rainy season.
''',
      subdesc:
          'Brown blight, caused by Colletotrichum species, results in dark lesions on tea leaves and extensive defoliation, reducing tea quality and yield.'),
  Disease(
      title: 'Chlorina',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgCq7LKyYcsEJUBdGl4MUJ3RdVPevjpNJP1eP3U-T0p63hPh3W-4nzXOVnZyR-UJiz3A4VrIR5wiOsYnLfGMwO7fG2cAS1UjMWDjVVh63WAQm84ybNK2V_s6Vo8DjQ-2hbf3b-60niVey79hXF47yjqMp_yAjSekuDpDIP4jBWMzedrCFwvwAYcmyPENuCR/w320-h320/Chlorina_1.jpg',
      description: '''
**Description**: Chlorina is a condition characterized by the yellowing of leaves in tea plants, usually due to nutrient deficiencies or environmental stressors.
**Symptoms**: Leaves exhibit a uniform yellowing or chlorosis, starting from the leaf tips and spreading towards the base, while veins may remain green initially. Affected tea plants often show reduced growth and smaller leaf size. In severe cases, chlorotic leaves may become brittle and drop prematurely, leading to defoliation.
**Impact**: The yellowing of leaves reduces chlorophyll content, directly impacting photosynthesis and overall plant energy production. This results in lower yields, affecting the quantity and quality of tea leaves. Additionally, chlorina can make tea plants more vulnerable to other diseases and environmental stresses due to weakened plant health.
**Causes**: 
- **Nutrient Deficiencies**: Most commonly caused by deficiencies of essential nutrients like nitrogen, magnesium, or iron, which are vital for chlorophyll production.
- **Soil pH Imbalance**: High soil pH or poor soil health can hinder nutrient uptake, leading to chlorosis.
- **Waterlogging**: Poor drainage and waterlogged soil conditions can damage roots, restricting their ability to absorb nutrients, contributing to chlorosis.
- **Pests or Diseases**: Certain pests and diseases can damage the roots or vascular system, reducing the plant’s ability to take up nutrients.
**Management**: 
- **Nutrient Management**: Apply balanced fertilizers containing essential nutrients like nitrogen, magnesium, and iron to address deficiencies.
- **Soil pH Management**: Conduct soil testing and adjust pH as needed using lime or sulfur to create conditions that promote optimal nutrient availability.
- **Improve Drainage**: Ensure proper drainage to prevent waterlogging, especially in areas with heavy rainfall.
- **Regular Monitoring**: Regularly monitor plants for signs of chlorosis and address nutrient deficiencies promptly to prevent long-term damage.
''',
      subdesc:
          'Chlorina is characterized by yellowing leaves due to nutrient deficiencies or environmental stress, reducing photosynthesis and tea yields.'),
  Disease(
      title: 'Gray Blight',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgtQRBXS_WnO_nhcB9XRM3kAjh93C4BdQyQTtsdSzjj8Vbu7o9cHJOR6cuMvfEGPiXV08Z373PmcvJOaGZoNjdEFKbmYYonXIf2VpHgsuQaQMPv8sLqOd_1SoBQKLpA85i7ShO0P-0JrY18g0Tsu2oo9VKXo8UkZYAC77dcIStbX4pJhLET6NvzgCSlAWgs/w320-h320/GrayBlight_2.jpg',
      description: '''
**Description**: Gray blight is a fungal disease caused by Pestalotiopsis spp., affecting the leaves of tea plants.
**Symptoms**: The disease starts with small brown spots on the upper surface of tea leaves that gradually increase in size. The spots can be irregular in shape and size. As the disease progresses, the spots turn dark brown with a grayish center and show concentric zonation around the edges. The necrotic lesions eventually turn light gray.
**Impact**: Extensive leaf drop due to gray blight reduces the overall leaf area available for photosynthesis, impacting plant energy production. This leads to lower yields, affecting both the quality and quantity of the tea harvest. Continuous infections can weaken tea bushes, making them more susceptible to other pests and diseases.
**Causes**: 
- **Fungal Pathogen**: Caused by the fungus Pestalotiopsis spp., which thrives in moist and humid conditions.
- **Environmental Factors**: The disease is more prevalent during the rainy season when moisture levels are high.
- **Poor Air Circulation**: Densely planted areas or those with inadequate pruning can have reduced airflow, creating conditions favorable for the fungus.
**Management**: 
- **Cultural Practices**: Space tea bushes properly to allow for air circulation and reduce humidity levels.
- **Chemical Control**: Spray with Copper Oxychloride or Bordeaux mixture during the winter and summer to manage the spread of the disease.
- **Plant Care**: Avoid stressing the plants to maintain their overall health and resilience.
''',
      subdesc:
          'Gray blight, caused by Pestalotiopsis spp., leads to dark brown spots with gray centers on tea leaves, causing defoliation and reduced yield.'),
  Disease(
      title: 'Healthy',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi7FsayqxgTigZDCpBTgtEXLAcDorjwRh8smkghKQS3JuylaUAkch-KAm_s4DMbIDB-RG4tMP7Fu0Z0o8squxrClZhOf1RyZiIwDL-gl8s8gN_bQQlT830dXIo1CncctXa1TWSkD7W19gOJa5foFqSNBlINVQF4yO_8565WmEv7G5jj73N_3l-oJq0MDFOR/w240-h320/Healthy_12.jpg', 
      description: '''
**Description**: Healthy tea plants are characterized by vibrant green foliage and robust growth, indicating optimal health and vigor.
**Characteristics**: 
- **Lush, Green Leaves**: Healthy tea plants exhibit lush, vibrant green leaves that are free from spots or discoloration.
- **Vigorous Growth**: The plants show consistent development of new shoots and leaves.
- **Root System**: A well-developed root system aids in nutrient absorption and water retention.
- **Uniform Canopy**: The canopy of healthy tea bushes is uniform, indicating balanced growth and proper pruning.
- **Pest Resistance**: Healthy plants have a higher resistance to pests and diseases, reducing the need for chemical interventions.

**Environmental Factors**: 
- Tea plants thrive in regions with well-distributed rainfall, moderate temperatures, and good sunlight.
- Well-drained, fertile soil rich in organic matter supports healthy growth.
- Surrounding biodiversity can enhance resilience against pests and diseases by promoting natural predators.

**Cultural Practices for Maintenance**: 
- **Proper Irrigation**: Ensure adequate water supply without waterlogging to support growth.
- **Nutrient Management**: Apply balanced fertilizers to provide essential nutrients.
- **Regular Pruning**: Pruning promotes bushy growth and improves air circulation, reducing disease risk.
- **Sanitation**: Remove dead leaves and debris to minimize sources of pathogens.
- **Pest Monitoring**: Regularly inspect plants for signs of pests and diseases for early intervention.
''',
      subdesc:
          'Healthy tea plants exhibit vibrant green leaves, vigorous growth, and a well-developed root system, showing resistance to pests and diseases.'),
  Disease(
      title: 'Lycan',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhAXjsQOd7YVcETsTe2HA-RH-yf6ffh9iLbPUnfYjIIwEFtmdGEbrnvZORJ4A5ha3h98zae7xhlQcVieTzY-Yz3cZ_8JF2k80kW5G-utZ1FbtORcppjay4ity2jfjO0jAKe_SZvpo7lvSkHgMymRe04qaN863zq_XT1z4-mLRDzYgyUwAyZh_RbBQ_hkPkB/w320-h320/Lycan_48.jpg', 
      description: '''
**Description**: Lichens are symbiotic organisms that can appear on the stems, branches, and leaves of tea plants, often indicating environmental stress.
**Symptoms**: 
- **Appearance**: Lichens appear as greenish, gray, or white crusty patches on the affected areas.
- **Stunted Growth**: Affected plants may show stunted growth or reduced vigor overall.
- **Bark Damage**: Extensive growth of lichens on young stems can damage the bark, affecting nutrient transport.

**Causes**: 
- **Environmental Conditions**: Lichens thrive in areas with high humidity, poor air circulation, and shaded environments.
- **Nutrient Deficiency**: They are more likely to appear on stressed or weakened plants due to nutrient deficiencies or poor health.
- **Biodiversity**: High biodiversity in the surrounding environment can contribute to the presence of lichens, as they are a natural part of many ecosystems.

**Impact**: 
- **Aesthetic Issues**: While lichens are generally not harmful, their presence can be considered unsightly and reduce the aesthetic value of tea plantations.
- **Potential Competition**: In high infestations, lichens may compete for resources like light and moisture, potentially impacting the growth of the tea plant.

**Control**: 
- **Cultural Practices**: Improve air circulation by maintaining proper spacing and pruning to reduce humidity and improve sunlight exposure.
- **Chemical Control**: If necessary, specific lichenicides may be used, though they are typically not recommended due to environmental impact and the generally low harm caused by lichens.
''',
      subdesc:
          'Lichens are crusty patches on tea plants that indicate environmental stress, potentially competing for resources and affecting growth.'),
  Disease(
      title: 'Red Rust',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgeAupFPVeRB6T4xjZtmqxpSPtiqGpFQUSqcXaCoD3OyuuKN8VEvLSI6J2-PPM0cA-dF9FXV4I4D5iI8lry6BAHltF7EaSzgLxBeSLviuTKGW_RkCwUeYQycN_SLv3ej9zJ83ZV6TvPMHPIQ7NxQgYhPS5aCNpby2EASjjp1foUqGgX2Q6NdiLbafxVHFkX/w320-h240/RedRust_14.jpg', 
      description: '''
**Description**: Red rust is a fungal disease that affects tea plants, characterized by rust-colored spots on the leaves, leading to significant agricultural challenges.
**Symptoms**: 
- **Rust-colored Spots**: Initial symptoms include small, rust-colored pustules on the underside of leaves, which are the fruiting bodies of the fungus.
- **Leaf Discoloration**: The upper side of affected leaves may show yellowing or browning corresponding to the rust spots beneath.
- **Defoliation**: In severe cases, extensive defoliation can occur, leading to reduced photosynthesis and growth.

**Causes**: 
- **Fungal Pathogen**: Caused by the fungus *Calonectria theae*, which thrives in warm and humid conditions.
- **Spore Spread**: The disease spreads via windborne spores, especially during periods of high humidity and rainfall.
- **Infected Material**: Infected plant material and equipment can also contribute to the spread of the disease.

**Impact**: 
- **Reduced Yield**: Red rust can significantly reduce the quantity and quality of tea leaves harvested.
- **Economic Losses**: Affected crops can lead to financial losses for growers due to lower market value and increased management costs.
- **Plant Health**: Continuous infections may weaken the plant, making it more susceptible to other pests and diseases.

**Control**: 
- **Cultural Practices**: Improve air circulation around plants by proper spacing and pruning to reduce humidity. Maintain good sanitation by removing infected leaves and debris from the plantation.
- **Chemical Control**: The application of fungicides such as copper-based products or systemic fungicides can effectively control the disease. Fungicides should be applied during early signs of infection and before the onset of high humidity conditions.
- **Resistance Varieties**: Planting disease-resistant tea varieties can help manage the disease in the long term.
''',
      subdesc:
          'Red rust is a fungal disease marked by rust-colored pustules on tea leaves, causing significant yield loss and economic impacts.'),
];
