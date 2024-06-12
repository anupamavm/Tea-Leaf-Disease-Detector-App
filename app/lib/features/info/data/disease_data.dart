// disease_data.dart
class Disease {
  final String title;
  final String tagline;
  final String imageUrl;
  final String description;
  final String subdesc;

  Disease({
    required this.title,
    required this.tagline,
    required this.imageUrl,
    required this.description,
    required this.subdesc,
  });
}

final List<Disease> diseases = [
  Disease(
      title: 'Blister Blight',
      tagline: 'Exobasidium vexans',
      imageUrl:
          'https://th.bing.com/th/id/R.599a6a129321e6666e3c99272c52fc7f?rik=7Fmv1JPYNWEEvQ&riu=http%3a%2f%2fwww.myjapanesegreentea.com%2fwp-content%2fuploads%2f2015%2f09%2fblister-blight.jpg&ehk=QTrUt9dgQGeCjbq19PM4mDaXDRksWRlcQta1Cz%2fLIy4%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
      description: '''
**Description**: Blister blight is a fungal disease that primarily affects young leaves, shoots, and buds of tea plants.
**Symptoms**: The disease manifests as blister-like lesions on the upper surface of young leaves. These blisters are initially pale green but later turn white or pale brown. Infected areas may become distorted and stunted.
**Impact**: Severe infestations can lead to significant yield loss and reduced quality of tea.
**Management**: Regular monitoring, pruning of affected shoots, and application of fungicides such as copper-based compounds or systemic fungicides can help control the disease.
''',
      subdesc:
          'Blister blight primarily affects young leaves, shoots, and buds of tea plants, causing blister-like lesions that can lead to yield loss and reduced tea quality.'),

  Disease(
      title: 'Red Rust',
      tagline: 'Cephaleuros virescens',
      imageUrl:
          'https://s3.amazonaws.com/plantvillage-production-new/images/pics/000/004/929/large/6920774335_7bc02db2b7_z.jpg?1429282418',
      description: '''
**Description**: Red rust is an algal disease that affects the leaves, stems, and branches of tea plants.
**Symptoms**: The disease appears as reddish-orange, velvety patches on the leaves. These patches are made up of spore-producing structures of the algae.
**Impact**: It weakens the plant, causing reduced vigor and productivity.
**Management**: Improve air circulation by pruning and spacing plants, and apply copper-based fungicides to manage the spread.
''',
      subdesc:
          'Red rust is an algal disease that weakens tea plants by causing reddish-orange, velvety patches on leaves, stems, and branches.'),

  Disease(
      title: 'Grey Blight',
      tagline: 'Pestalotiopsis theae',
      imageUrl:
          'https://www.researchgate.net/publication/284785803/figure/fig4/AS:666699623850004@1535964985821/Tea-leaf-image-affected-by-disease.png',
      description: '''
**Description**: Grey blight is caused by a fungal pathogen and affects tea leaves.
**Symptoms**: The disease causes grey or brown spots with concentric rings on the leaves. These spots may coalesce, leading to large necrotic areas.
**Impact**: The disease can cause defoliation, weakening the plant and reducing yield.
**Management**: Remove and destroy infected leaves, improve field sanitation, and apply appropriate fungicides.
''',
      subdesc:
          'Grey blight, a fungal disease, leads to the formation of grey or brown spots on tea leaves, often resulting in defoliation and reduced plant yield.'),

  Disease(
      title: 'Brown Blight',
      tagline: 'Colletotrichum camelliae',
      imageUrl:
          'https://www.mdpi.com/forests/forests-14-00619/article_deploy/html/images/forests-14-00619-g001.png',
      description: '''
**Description**: Brown blight is a fungal disease affecting tea leaves.
**Symptoms**: It produces brown or black lesions on the leaves, often with a characteristic yellow halo. The lesions may enlarge and merge, causing significant leaf damage.
**Impact**: This disease can lead to leaf drop and reduced plant vigor.
**Management**: Use resistant varieties, ensure proper field hygiene, and apply fungicides such as Mancozeb or Thiophanate-methyl.
''',
      subdesc:
          'Brown blight, caused by a fungal pathogen, results in brown or black lesions on tea leaves, leading to leaf drop and reduced plant vigor.'),

  Disease(
      title: 'Black Root Rot',
      tagline: 'Rosellinia arcuata',
      imageUrl:
          'https://www.mdpi.com/forests/forests-14-00619/article_deploy/html/images/forests-14-00619-g001.png',
      description: '''
**Description**: Black root rot is a soil-borne fungal disease that affects the roots of tea plants.
**Symptoms**: Infected roots become blackened and decayed. Above-ground symptoms include wilting, yellowing of leaves, and stunted growth.
**Impact**: Severe infections can cause plant death.
**Management**: Improve soil drainage, remove and destroy infected plants, and use soil fumigants or fungicides to manage the disease.
''',
      subdesc:
          'Black root rot, a soil-borne fungal disease, causes blackened and decayed roots in tea plants, potentially leading to plant death.'),

  Disease(
      title: 'Stem Canker',
      tagline: 'Phomopsis theae',
      imageUrl:
          'https://www.mdpi.com/forests/forests-14-00619/article_deploy/html/images/forests-14-00619-g001.png',
      description: '''
**Description**: Stem canker is caused by a fungal pathogen that affects the stems and branches of tea plants.
**Symptoms**: It causes dark, sunken lesions on the stems and branches. These lesions may girdle the stems, leading to dieback.
**Impact**: The disease can significantly reduce yield and plant health.
**Management**: Prune and destroy infected parts, maintain field hygiene, and apply fungicides such as Carbendazim or Trifloxystrobin.
''',
      subdesc:
          'Stem canker, caused by a fungal pathogen, leads to dark, sunken lesions on tea stems and branches, potentially reducing plant yield and health.'),

  // Disease
  Disease(
    title: 'Purple Blotch',
    tagline: 'Alternaria alternata',
    imageUrl:
        'https://www.mdpi.com/forests/forests-14-00619/article_deploy/html/images/forests-14-00619-g001.png',
    description: '''
  **Description**: Purple blotch is a fungal disease that affects the leaves of tea plants.
    **Symptoms**: The disease causes purple or brown lesions on the leaves. These lesions often have a target-like appearance with concentric rings.
    **Impact**: Severe infections can lead to significant leaf drop and reduced photosynthesis.
    **Management**: Use resistant varieties, ensure proper spacing for good air circulation, and apply fungicides like Chlorothalonil or Azoxystrobin.

''',
    subdesc:
        'Purple blotch, a fungal disease, results in purple or brown lesions on tea leaves, potentially leading to significant leaf drop and reduced photosynthesis.',
  ),

  // Disease
  Disease(
      title: 'Root Knot Nematodes',
      tagline: 'Meloidogyne spp',
      imageUrl:
          'https://www.mdpi.com/forests/forests-14-00619/article_deploy/html/images/forests-14-00619-g001.png',
      description: '''
  **Description**: Root knot nematodes are microscopic roundworms that infect the roots of tea plants.
 **Symptoms**: Infested roots develop galls or knots, hindering nutrient and water uptake. Above-ground symptoms include stunted growth, yellowing of leaves, and poor yields.
   **Impact**: Severe infestations can significantly reduce plant health and productivity.
   **Management**: Use nematode-resistant varieties, practice crop rotation, and apply nematicides to reduce nematode populations.
''',
      subdesc:
          'Root knot nematodes, microscopic roundworms, infect tea roots, leading to galls or knots and hindering nutrient uptake, potentially reducing plant health and productivity.'),
];
