import 'package:derma_skin_app/help_supprot_pages/cancer_result_page.dart';
import 'package:flutter/material.dart';

class CancerInformationPage extends StatelessWidget {
  const CancerInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF607C6D).withOpacity(0.5),
          title: const Center(
            child: Text(
              "Cancer Information Page",
              style: TextStyle(color: Colors.white),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFeaecdf).withOpacity(0.5),
            child: Center(
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  color: const Color(0xFFBCC1AA).withOpacity(0.5),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16.0), // Add some left padding if needed
                      child: Text(
                        "Skin Cancer",
                        style: TextStyle(
                          color: Color(0xFF607C6D),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancerResultPage(
                              title: 'Melanoma',
                              description1:
                                  'Melanoma is a serious form of skin cancer that originates in the melanocytes, the pigment-producing cells of the skin. These cells, located in the deeper layers of the skin, can undergo mutations when exposed to UV radiation from the sun or tanning beds. These mutations lead to uncontrolled cell growth, forming a tumor that can invade and damage surrounding tissues. While melanoma can develop from existing birthmarks or skin patches, it often appears spontaneously.',
                              description2:
                                  'Melanoma is known for its aggressive nature and potential to be life-threatening. At an early stage, when the melanoma is superficial and confined, it can often be successfully treated through surgical removal. However, if the cancerous cells spread to other parts of the body, such as lymph nodes or organs, it becomes much more dangerous and can be fatal. Therefore, vigilance and early detection are crucial.',
                              description3:
                                  'The appearance of melanoma can vary widely and may occur anywhere on the body. Key warning signs include changes in the size, shape, and color of moles or skin spots, as well as symptoms like itching, pain, bleeding, and inflammation. Melanomas often exhibit multiple colors, including black, brown, blue-black, white, pink, or red, and may present with irregular edges and uneven surfaces.',
                              description4:
                                  'There are several forms of melanoma, each with distinct characteristics. Melanoma in situ is confined to the upper layers of the skin with no metastases. Lentigo maligna starts as a brown or black spot and slowly progresses to melanoma. Superficial spreading melanoma is the most common type and grows slowly in the skin. Nodular melanoma appears as a dark lump and can be ulcerated. Rare forms include acrolentiginous melanoma, which occurs on palms, soles, and nails; mucosal melanomas found on mucous membranes; and amelanotic melanomas, which lack pigmentation and appear pink. Risk factors for melanoma include excessive UV exposure, having numerous or atypical moles, having a light skin type, and a family history of melanoma. Treatment typically involves surgical removal of the melanoma, followed by examination in a laboratory. For advanced stages, additional treatments may be necessary to manage metastases.',
                              type: 'Skin Cancer',
                            ),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Melanoma",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancerResultPage(
                              title: 'Basal cell carcinoma',
                              description1:
                                  'Basal cell carcinoma (BCC) is the most common type of skin cancer, typically developing in areas of the skin that are frequently exposed to the sun, such as the face, neck, trunk, or limbs. It generally grows slowly and is usually not aggressive. The most common variant, nodular basal cell carcinoma, appears as a small, pink, shiny, or pearly lump. Over time, this lump can develop a crust in the center and turn into an ulcer. While BCC rarely spreads to other organs, timely removal is advised to avoid larger, more challenging treatment issues and to minimize scarring.',
                              description2:
                                  'BCC can present in various forms and is often identified through clinical examination and confirmed with a biopsy. The most common appearance is nodular basal cell carcinoma, which features a slow-growing bump with a pearly sheen and sometimes tiny blood vessels. Superficial spreading basal cell carcinoma lies just beneath the skin’s surface and can resemble eczema, often not responding to typical eczema treatments. Pigmented basal cell carcinoma is rare but appears as a dark-colored skin tumor. Sclerosing basal cell carcinoma may look like a scar with spiky edges, while micronodular basal cell carcinoma appears as a cluster of small bumps.',
                              description3:
                                  'The primary risk factors for developing BCC include excessive sun exposure, frequent sunburns, fair skin, and a high number of birthmarks. Additionally, individuals who have undergone radiotherapy at a young age, work outdoors frequently, or have a rare genetic condition called Basal Cell Naevus Syndrome (BCNS) are at higher risk.',
                              description4:
                                  'Treatment for basal cell carcinoma usually involves surgical removal of the tumor under local anesthesia. Other treatment options include photodynamic therapy, which uses a light-sensitive ointment to treat the tumor, cryosurgery, which involves freezing the tumor, and topical creams designed to clear the cancerous cells. Early intervention helps ensure effective treatment and reduces the likelihood of extensive scarring.',
                              type: 'Skin Cancer',
                            ),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Basal cell carcinoma",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancerResultPage(
                              title: 'Squamous Cell Carcinoma',
                              description1:
                                  'Squamous cell carcinoma (SCC) is the second most common form of skin cancer, following basal cell carcinoma. It often arises from skin or mucous membranes that have undergone previous damage, rather than from normal-looking skin. SCC typically develops in areas affected by sun damage, such as those with pigmentary shifts, ultra-thin skin, wrinkles, or visible red vessels. It can also appear in areas of yellowish discoloration. The tumor is less likely to arise in normal skin and more commonly develops from pre-existing skin conditions or damaged areas.',
                              description2:
                                  'In general, the prognosis for SCC is favorable, especially when detected early. Treatment is usually effective, with the skin spot often being completely removed. While SCC typically does not metastasize, it has the potential to spread to the lymph nodes, particularly if it occurs on the ears, lips, or genital regions. The tumors ability to spread makes timely treatment important to prevent further complications.',
                              description3:
                                  'SCC commonly starts as a thickened area of skin with a hardened, horn-like layer that eventually grows into a sizable lump or a non-healing wound. The edges of SCC lesions are often irregular, and inflammation and bleeding can occur around the affected area. These tumors often develop on sun-exposed areas of the body but can also appear on mucous membranes. Diagnosis is typically made through clinical examination and confirmed with a biopsy.',
                              description4:
                                  'Preliminary stages of SCC include Bowens disease, also known as squamous cell carcinoma in situ, which presents as a scaly, rough, and red patch on the skin that grows slowly and may develop scabs. Bowens disease is characterized by malignant cells confined to the top layer of the skin and can sometimes be mistaken for eczema or psoriasis. Another precursor is actinic keratosis, which appears as skin-colored to reddish-brown elevations with a rough, crusty surface, often accompanied by itching or discomfort. Risk factors for SCC include excessive UV exposure, a weakened immune system, a history of actinic keratosis or skin cancer, smoking, light skin types, and treatments like PUVA light therapy and radiotherapy. Treatment for SCC typically involves surgical removal of the tumor under local anesthesia, with radiotherapy used in some cases.',
                              type: 'Skin Cancer',
                            ),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Squamous Cell Carcinoma",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: const Color(0xFFBCC1AA).withOpacity(0.5),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16.0), // Add some left padding if needed
                      child: Text(
                        "Skin Spots",
                        style: TextStyle(
                          color: Color(0xFF607C6D),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancerResultPage(
                              title: 'Actinic Keratosis',
                              description1:
                                  'Actinic keratosis (AK) is a common skin condition resulting from sun damage and is considered a potential precursor to skin cancer. It is particularly prevalent among older individuals with lighter skin who have experienced significant sun exposure, whether from outdoor activities or tanning beds. AK often appears as small, rough patches that may range from skin-colored to reddish-brown. These patches typically have a crusty surface that can be white, yellow, or brown and feel rough like sandpaper when touched. Common locations for these lesions include sun-exposed areas such as the face, backs of hands, arms, legs, décolleté, and the scalp in balding men.',
                              description2:
                                  'While actinic keratosis itself is not cancerous, it can progress to squamous cell carcinoma if left untreated. Malignant AK patches are characterized by inflammation, hardening, and rapid growth, with a diameter greater than 1 cm. They may also bleed easily, become red, and develop ulcers, indicating a higher risk of skin cancer.',
                              description3:
                                  'To manage actinic keratosis, treatment is essential due to its potential progression to skin cancer. Treatment options typically include cryotherapy, where ice-cold liquid is applied to the affected areas, and topical creams prescribed by a healthcare specialist. These methods are effective in removing or reducing the lesions. It is important to avoid attempting self-treatment for AK.',
                              description4:
                                  'Prevention plays a crucial role in managing actinic keratosis and minimizing the risk of skin damage. Regular use of sunscreen with at least SPF 30, and ideally SPF 50, is recommended to protect the skin from harmful UV rays. Adopting sun protection measures, such as wearing protective clothing and seeking shade, can help prevent the development of AK and other sun-induced skin conditions.',
                              type: 'Skin Spots',
                            ),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Actinic Keratosis",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancerResultPage(
                              title: 'Age Warts',
                              description1:
                                  'Actinic keratosis (AK) is a common skin condition resulting from sun damage and is considered a potential precursor to skin cancer. It is particularly prevalent among older individuals with lighter skin who have experienced significant sun exposure, whether from outdoor activities or tanning beds. AK often appears as small, rough patches that may range from skin-colored to reddish-brown. These patches typically have a crusty surface that can be white, yellow, or brown and feel rough like sandpaper when touched. Common locations for these lesions include sun-exposed areas such as the face, backs of hands, arms, legs, décolleté, and the scalp in balding men.',
                              description2:
                                  'While actinic keratosis itself is not cancerous, it can progress to squamous cell carcinoma if left untreated. Malignant AK patches are characterized by inflammation, hardening, and rapid growth, with a diameter greater than 1 cm. They may also bleed easily, become red, and develop ulcers, indicating a higher risk of skin cancer.',
                              description3:
                                  'To manage actinic keratosis, treatment is essential due to its potential progression to skin cancer. Treatment options typically include cryotherapy, where ice-cold liquid is applied to the affected areas, and topical creams prescribed by a healthcare specialist. These methods are effective in removing or reducing the lesions. It is important to avoid attempting self-treatment for AK.',
                              description4:
                                  'Prevention plays a crucial role in managing actinic keratosis and minimizing the risk of skin damage. Regular use of sunscreen with at least SPF 30, and ideally SPF 50, is recommended to protect the skin from harmful UV rays. Adopting sun protection measures, such as wearing protective clothing and seeking shade, can help prevent the development of AK and other sun-induced skin conditions.',
                              type: 'Skin Spots',
                            ),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Age Warts",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CancerResultPage(
                              title: 'Angiomas',
                              description1:
                                  'Actinic keratosis (AK) is a common skin condition resulting from sun damage and is considered a potential precursor to skin cancer. It is particularly prevalent among older individuals with lighter skin who have experienced significant sun exposure, whether from outdoor activities or tanning beds. AK often appears as small, rough patches that may range from skin-colored to reddish-brown. These patches typically have a crusty surface that can be white, yellow, or brown and feel rough like sandpaper when touched. Common locations for these lesions include sun-exposed areas such as the face, backs of hands, arms, legs, décolleté, and the scalp in balding men.',
                              description2:
                                  'While actinic keratosis itself is not cancerous, it can progress to squamous cell carcinoma if left untreated. Malignant AK patches are characterized by inflammation, hardening, and rapid growth, with a diameter greater than 1 cm. They may also bleed easily, become red, and develop ulcers, indicating a higher risk of skin cancer.',
                              description3:
                                  'To manage actinic keratosis, treatment is essential due to its potential progression to skin cancer. Treatment options typically include cryotherapy, where ice-cold liquid is applied to the affected areas, and topical creams prescribed by a healthcare specialist. These methods are effective in removing or reducing the lesions. It is important to avoid attempting self-treatment for AK.',
                              description4:
                                  'Prevention plays a crucial role in managing actinic keratosis and minimizing the risk of skin damage. Regular use of sunscreen with at least SPF 30, and ideally SPF 50, is recommended to protect the skin from harmful UV rays. Adopting sun protection measures, such as wearing protective clothing and seeking shade, can help prevent the development of AK and other sun-induced skin conditions.',
                              type: 'Skin Spots',
                            ),
                          ),
                        );
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Angiomas",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      color: const Color(0xFFBCC1AA).withOpacity(0.5),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0), // Add some left padding if needed
                          child: Text(
                            "Skin Condition",
                            style: TextStyle(
                              color: Color(0xFF607C6D),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CancerResultPage(
                                  title: 'Acne',
                                  description1:
                                      'Actinic keratosis (AK) is a common skin condition resulting from sun damage and is considered a potential precursor to skin cancer. It is particularly prevalent among older individuals with lighter skin who have experienced significant sun exposure, whether from outdoor activities or tanning beds. AK often appears as small, rough patches that may range from skin-colored to reddish-brown. These patches typically have a crusty surface that can be white, yellow, or brown and feel rough like sandpaper when touched. Common locations for these lesions include sun-exposed areas such as the face, backs of hands, arms, legs, décolleté, and the scalp in balding men.',
                                  description2:
                                      'While actinic keratosis itself is not cancerous, it can progress to squamous cell carcinoma if left untreated. Malignant AK patches are characterized by inflammation, hardening, and rapid growth, with a diameter greater than 1 cm. They may also bleed easily, become red, and develop ulcers, indicating a higher risk of skin cancer.',
                                  description3:
                                      'To manage actinic keratosis, treatment is essential due to its potential progression to skin cancer. Treatment options typically include cryotherapy, where ice-cold liquid is applied to the affected areas, and topical creams prescribed by a healthcare specialist. These methods are effective in removing or reducing the lesions. It is important to avoid attempting self-treatment for AK.',
                                  description4:
                                      'Prevention plays a crucial role in managing actinic keratosis and minimizing the risk of skin damage. Regular use of sunscreen with at least SPF 30, and ideally SPF 50, is recommended to protect the skin from harmful UV rays. Adopting sun protection measures, such as wearing protective clothing and seeking shade, can help prevent the development of AK and other sun-induced skin conditions.',
                                  type: 'Skin Condition',
                                ),
                              ),
                            );
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Acne",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CancerResultPage(
                                  title: 'Blisters',
                                  description1:
                                      'Actinic keratosis (AK) is a common skin condition resulting from sun damage and is considered a potential precursor to skin cancer. It is particularly prevalent among older individuals with lighter skin who have experienced significant sun exposure, whether from outdoor activities or tanning beds. AK often appears as small, rough patches that may range from skin-colored to reddish-brown. These patches typically have a crusty surface that can be white, yellow, or brown and feel rough like sandpaper when touched. Common locations for these lesions include sun-exposed areas such as the face, backs of hands, arms, legs, décolleté, and the scalp in balding men.',
                                  description2:
                                      'While actinic keratosis itself is not cancerous, it can progress to squamous cell carcinoma if left untreated. Malignant AK patches are characterized by inflammation, hardening, and rapid growth, with a diameter greater than 1 cm. They may also bleed easily, become red, and develop ulcers, indicating a higher risk of skin cancer.',
                                  description3:
                                      'To manage actinic keratosis, treatment is essential due to its potential progression to skin cancer. Treatment options typically include cryotherapy, where ice-cold liquid is applied to the affected areas, and topical creams prescribed by a healthcare specialist. These methods are effective in removing or reducing the lesions. It is important to avoid attempting self-treatment for AK.',
                                  description4:
                                      'Prevention plays a crucial role in managing actinic keratosis and minimizing the risk of skin damage. Regular use of sunscreen with at least SPF 30, and ideally SPF 50, is recommended to protect the skin from harmful UV rays. Adopting sun protection measures, such as wearing protective clothing and seeking shade, can help prevent the development of AK and other sun-induced skin conditions.',
                                  type: 'Skin Condition',
                                ),
                              ),
                            );
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Blisters",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CancerResultPage(
                                  title: 'Dermatofibroma',
                                  description1:
                                      'Actinic keratosis (AK) is a common skin condition resulting from sun damage and is considered a potential precursor to skin cancer. It is particularly prevalent among older individuals with lighter skin who have experienced significant sun exposure, whether from outdoor activities or tanning beds. AK often appears as small, rough patches that may range from skin-colored to reddish-brown. These patches typically have a crusty surface that can be white, yellow, or brown and feel rough like sandpaper when touched. Common locations for these lesions include sun-exposed areas such as the face, backs of hands, arms, legs, décolleté, and the scalp in balding men.',
                                  description2:
                                      'While actinic keratosis itself is not cancerous, it can progress to squamous cell carcinoma if left untreated. Malignant AK patches are characterized by inflammation, hardening, and rapid growth, with a diameter greater than 1 cm. They may also bleed easily, become red, and develop ulcers, indicating a higher risk of skin cancer.',
                                  description3:
                                      'To manage actinic keratosis, treatment is essential due to its potential progression to skin cancer. Treatment options typically include cryotherapy, where ice-cold liquid is applied to the affected areas, and topical creams prescribed by a healthcare specialist. These methods are effective in removing or reducing the lesions. It is important to avoid attempting self-treatment for AK.',
                                  description4:
                                      'Prevention plays a crucial role in managing actinic keratosis and minimizing the risk of skin damage. Regular use of sunscreen with at least SPF 30, and ideally SPF 50, is recommended to protect the skin from harmful UV rays. Adopting sun protection measures, such as wearing protective clothing and seeking shade, can help prevent the development of AK and other sun-induced skin conditions.',
                                  type: 'Skin Condition',
                                ),
                              ),
                            );
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Dermatofibroma",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
