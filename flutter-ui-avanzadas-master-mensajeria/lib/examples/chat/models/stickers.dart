class Stickers {
  final String name;
  final List<String> items;

  Stickers({this.name, this.items});

  factory Stickers.fromJson(Map<String, dynamic> json) =>
      Stickers(name: json['name'], items: List<String>.from(json['items']));

  static List<Stickers> get all {
    return stickers.map((item) => Stickers.fromJson(item)).toList();
  }
}

final stickers = [
  {
    "name": "Dragon Ball",
    "items": [
      "https://user-images.githubusercontent.com/15864336/78963451-28caac00-7abd-11ea-9dbb-2d941e10ad28.png",
      "https://user-images.githubusercontent.com/15864336/78963453-29fbd900-7abd-11ea-9f47-96d2a5053fb7.png",
      "https://user-images.githubusercontent.com/15864336/78963454-2a946f80-7abd-11ea-9156-13279b421e43.png",
      "https://user-images.githubusercontent.com/15864336/78963455-2b2d0600-7abd-11ea-925d-0799edda83d6.png",
      "https://user-images.githubusercontent.com/15864336/78963456-2b2d0600-7abd-11ea-81fd-38f5d83fb760.png",
      "https://user-images.githubusercontent.com/15864336/78963457-2bc59c80-7abd-11ea-8a24-ff94224cc674.png",
      "https://user-images.githubusercontent.com/15864336/78963458-2bc59c80-7abd-11ea-8b64-0e3cf3bd5ca9.png",
      "https://user-images.githubusercontent.com/15864336/78963459-2c5e3300-7abd-11ea-8fac-9dca0ab1cb5e.png",
      "https://user-images.githubusercontent.com/15864336/78963460-2c5e3300-7abd-11ea-871d-3a2400b0443d.png",
      "https://user-images.githubusercontent.com/15864336/78963461-2c5e3300-7abd-11ea-970e-4e68b84ae9f1.png",
      "https://user-images.githubusercontent.com/15864336/78963462-2cf6c980-7abd-11ea-8f4e-e4dde0fc5d30.png",
      "https://user-images.githubusercontent.com/15864336/78963464-2cf6c980-7abd-11ea-9310-1ea298877e78.png",
      "https://user-images.githubusercontent.com/15864336/78963466-2d8f6000-7abd-11ea-9905-e98b01078313.png",
      "https://user-images.githubusercontent.com/15864336/78963467-2d8f6000-7abd-11ea-9b98-a27ffe75845c.png",
      "https://user-images.githubusercontent.com/15864336/78963468-2d8f6000-7abd-11ea-97f2-1ea3a92b92e8.png",
      "https://user-images.githubusercontent.com/15864336/78963469-2e27f680-7abd-11ea-9325-5910ed153e8e.png",
      "https://user-images.githubusercontent.com/15864336/78963470-2ec08d00-7abd-11ea-956a-e4c5a83f9b5c.png",
      "https://user-images.githubusercontent.com/15864336/78963471-2ec08d00-7abd-11ea-9e2e-f47fa6ff062c.png",
      "https://user-images.githubusercontent.com/15864336/78963472-2f592380-7abd-11ea-8557-3a934ffa128e.png",
      "https://user-images.githubusercontent.com/15864336/78963473-2f592380-7abd-11ea-8d37-6e689274d40e.png",
      "https://user-images.githubusercontent.com/15864336/78963475-2ff1ba00-7abd-11ea-8e59-5bb3da2ad336.png",
      "https://user-images.githubusercontent.com/15864336/78963477-2ff1ba00-7abd-11ea-8657-f768f726f2e4.png",
      "https://user-images.githubusercontent.com/15864336/78963478-308a5080-7abd-11ea-8223-adbcc30487d3.png",
      "https://user-images.githubusercontent.com/15864336/78963479-308a5080-7abd-11ea-9310-54722917c66a.png",
      "https://user-images.githubusercontent.com/15864336/78963482-3122e700-7abd-11ea-998d-ab716c3a5928.png",
      "https://user-images.githubusercontent.com/15864336/78963484-31bb7d80-7abd-11ea-8096-f37ca7726689.png",
      "https://user-images.githubusercontent.com/15864336/78963485-31bb7d80-7abd-11ea-8c89-e348d5f54604.png",
      "https://user-images.githubusercontent.com/15864336/78963486-32541400-7abd-11ea-9161-3382b0fec86a.png",
      "https://user-images.githubusercontent.com/15864336/78963487-32541400-7abd-11ea-918a-697967762b75.png",
      "https://user-images.githubusercontent.com/15864336/78963488-32ecaa80-7abd-11ea-9e20-6fe982fbe93d.png"
    ]
  },
  {
    "name": "Avengers",
    "items": [
      "https://user-images.githubusercontent.com/15864336/78963625-b6a69700-7abd-11ea-8c4b-e1aac6bc1841.png",
      "https://user-images.githubusercontent.com/15864336/78963627-b7d7c400-7abd-11ea-8deb-7f88b590f16b.png",
      "https://user-images.githubusercontent.com/15864336/78963630-b8705a80-7abd-11ea-9a7d-e2855fac9f86.png",
      "https://user-images.githubusercontent.com/15864336/78963631-b908f100-7abd-11ea-9808-a41b77db00eb.png",
      "https://user-images.githubusercontent.com/15864336/78963633-b908f100-7abd-11ea-957b-4fec61661580.png",
      "https://user-images.githubusercontent.com/15864336/78963634-b9a18780-7abd-11ea-9228-361da8344101.png",
      "https://user-images.githubusercontent.com/15864336/78963635-b9a18780-7abd-11ea-997d-ca23cfffae86.png",
      "https://user-images.githubusercontent.com/15864336/78963636-ba3a1e00-7abd-11ea-9efe-777c367d85b9.png",
      "https://user-images.githubusercontent.com/15864336/78963639-ba3a1e00-7abd-11ea-9911-948a4d2465e3.png",
      "https://user-images.githubusercontent.com/15864336/78963640-bad2b480-7abd-11ea-8d3d-261759ba35fe.png",
      "https://user-images.githubusercontent.com/15864336/78963641-bad2b480-7abd-11ea-9809-939aeec42499.png",
      "https://user-images.githubusercontent.com/15864336/78963642-bad2b480-7abd-11ea-9685-f895386e0a26.png",
      "https://user-images.githubusercontent.com/15864336/78963643-bb6b4b00-7abd-11ea-8d8f-ab18ee4a6fc6.png",
      "https://user-images.githubusercontent.com/15864336/78963644-bb6b4b00-7abd-11ea-8718-ebc3a4c037c4.png",
      "https://user-images.githubusercontent.com/15864336/78963646-bb6b4b00-7abd-11ea-9e53-5acd60d4c918.png",
      "https://user-images.githubusercontent.com/15864336/78963647-bc03e180-7abd-11ea-8784-3a1c2e3d7e6b.png",
      "https://user-images.githubusercontent.com/15864336/78963648-bc03e180-7abd-11ea-945e-a4f1b77e003d.png",
      "https://user-images.githubusercontent.com/15864336/78963650-bc9c7800-7abd-11ea-8ec4-d9a27e39671e.png",
      "https://user-images.githubusercontent.com/15864336/78963651-bc9c7800-7abd-11ea-9b76-88db1541c840.png",
      "https://user-images.githubusercontent.com/15864336/78963653-bd350e80-7abd-11ea-9485-e118d552f946.png",
      "https://user-images.githubusercontent.com/15864336/78963654-bd350e80-7abd-11ea-9352-3e7647c70eed.png",
      "https://user-images.githubusercontent.com/15864336/78963655-bdcda500-7abd-11ea-87dd-5f69e7ff6c27.png",
      "https://user-images.githubusercontent.com/15864336/78963656-bdcda500-7abd-11ea-921d-c3d3f2e0a7af.png",
      "https://user-images.githubusercontent.com/15864336/78963657-bdcda500-7abd-11ea-8a08-1a445af1a5cd.png"
    ]
  },
  {
    "name": "Doraemon",
    "items": [
      "https://user-images.githubusercontent.com/15864336/78961251-83143e80-7ab6-11ea-875b-16f7b34f3769.png",
      "https://user-images.githubusercontent.com/15864336/78961252-84456b80-7ab6-11ea-8f24-9b33efd1f277.png",
      "https://user-images.githubusercontent.com/15864336/78961255-84de0200-7ab6-11ea-8306-3e43dbc6c70f.png",
      "https://user-images.githubusercontent.com/15864336/78961260-85769880-7ab6-11ea-90b2-c3e538eda498.png",
      "https://user-images.githubusercontent.com/15864336/78961261-860f2f00-7ab6-11ea-9250-17daab034bf1.png",
      "https://user-images.githubusercontent.com/15864336/78961262-860f2f00-7ab6-11ea-95c4-7cd35bf51e88.png",
      "https://user-images.githubusercontent.com/15864336/78961264-86a7c580-7ab6-11ea-898a-8435cc64d3b2.png",
      "https://user-images.githubusercontent.com/15864336/78961265-86a7c580-7ab6-11ea-994f-4eea8dd04912.png",
      "https://user-images.githubusercontent.com/15864336/78961266-87405c00-7ab6-11ea-8c15-a9c1fc793ed0.png",
      "https://user-images.githubusercontent.com/15864336/78961267-87405c00-7ab6-11ea-885a-f7d0c4aa0f08.png",
      "https://user-images.githubusercontent.com/15864336/78961268-87405c00-7ab6-11ea-8cfb-ceec500338f8.png",
      "https://user-images.githubusercontent.com/15864336/78961269-87d8f280-7ab6-11ea-8da2-5563ac98d8d9.png",
      "https://user-images.githubusercontent.com/15864336/78961271-87d8f280-7ab6-11ea-862a-10d71aa0f4af.png",
      "https://user-images.githubusercontent.com/15864336/78961272-88718900-7ab6-11ea-9f92-89507d4f4a75.png",
      "https://user-images.githubusercontent.com/15864336/78961274-88718900-7ab6-11ea-8504-9f79fb89d428.png",
      "https://user-images.githubusercontent.com/15864336/78961275-890a1f80-7ab6-11ea-9c28-40907d8541a7.png",
      "https://user-images.githubusercontent.com/15864336/78961277-89a2b600-7ab6-11ea-8401-af7c961b1887.png",
      "https://user-images.githubusercontent.com/15864336/78961278-89a2b600-7ab6-11ea-9d19-d29c65e21f8f.png",
      "https://user-images.githubusercontent.com/15864336/78961279-8a3b4c80-7ab6-11ea-9e4a-b9a9b9aa1fb4.png",
      "https://user-images.githubusercontent.com/15864336/78961280-8a3b4c80-7ab6-11ea-98bb-1f03504b0c80.png",
      "https://user-images.githubusercontent.com/15864336/78961281-8ad3e300-7ab6-11ea-96a8-28692a669c38.png",
      "https://user-images.githubusercontent.com/15864336/78961283-8b6c7980-7ab6-11ea-9888-0065874171c9.png",
      "https://user-images.githubusercontent.com/15864336/78961285-8b6c7980-7ab6-11ea-91fd-0cd03a82cce0.png",
      "https://user-images.githubusercontent.com/15864336/78961286-8c051000-7ab6-11ea-9896-9824517e9d60.png",
      "https://user-images.githubusercontent.com/15864336/78961287-8c051000-7ab6-11ea-8cb2-79b61eefa493.png",
      "https://user-images.githubusercontent.com/15864336/78961288-8c9da680-7ab6-11ea-9fa2-28a22be51944.png",
      "https://user-images.githubusercontent.com/15864336/78961289-8c9da680-7ab6-11ea-8e77-d9aa15af5628.png",
      "https://user-images.githubusercontent.com/15864336/78961290-8c9da680-7ab6-11ea-8e4f-907835d65bb9.png"
    ]
  },
  {
    "name": "Rabbit",
    "items": [
      "https://user-images.githubusercontent.com/15864336/78962180-6b8a8500-7ab9-11ea-8269-d718f8663313.png",
      "https://user-images.githubusercontent.com/15864336/78962182-6cbbb200-7ab9-11ea-84e8-174925652f89.png",
      "https://user-images.githubusercontent.com/15864336/78962186-6d544880-7ab9-11ea-87c1-014a35bd6ba2.png",
      "https://user-images.githubusercontent.com/15864336/78962187-6decdf00-7ab9-11ea-9a3e-3e06ed964e95.png",
      "https://user-images.githubusercontent.com/15864336/78962188-6decdf00-7ab9-11ea-9916-1c4ac058797e.png",
      "https://user-images.githubusercontent.com/15864336/78962190-6e857580-7ab9-11ea-8d51-9148756cf75a.png",
      "https://user-images.githubusercontent.com/15864336/78962191-6e857580-7ab9-11ea-8f5c-db12eb8861ef.png",
      "https://user-images.githubusercontent.com/15864336/78962193-6f1e0c00-7ab9-11ea-84f3-03804685a93b.png",
      "https://user-images.githubusercontent.com/15864336/78962194-6f1e0c00-7ab9-11ea-84f8-102dbf335428.png",
      "https://user-images.githubusercontent.com/15864336/78962195-6fb6a280-7ab9-11ea-8741-587096321414.png",
      "https://user-images.githubusercontent.com/15864336/78962196-6fb6a280-7ab9-11ea-8cd4-81c9cc6807c3.png",
      "https://user-images.githubusercontent.com/15864336/78962197-704f3900-7ab9-11ea-8f37-16008fc04e82.png",
      "https://user-images.githubusercontent.com/15864336/78962198-704f3900-7ab9-11ea-9c84-7f7dc611c2fc.png",
      "https://user-images.githubusercontent.com/15864336/78962199-704f3900-7ab9-11ea-8a37-7d87f75ff0fa.png"
    ]
  },
  {
    "name": "Procyon",
    "items": [
      "https://user-images.githubusercontent.com/15864336/78962789-d4263180-7aba-11ea-899c-4b246e23415f.png",
      "https://user-images.githubusercontent.com/15864336/78962791-d5575e80-7aba-11ea-8cb2-774c8729da6c.png",
      "https://user-images.githubusercontent.com/15864336/78962792-d5eff500-7aba-11ea-8ca2-01e2539996b2.png",
      "https://user-images.githubusercontent.com/15864336/78962793-d6888b80-7aba-11ea-8fb2-bdbf7e653b4f.png",
      "https://user-images.githubusercontent.com/15864336/78962796-d6888b80-7aba-11ea-9368-df36fd364eab.png",
      "https://user-images.githubusercontent.com/15864336/78962797-d7212200-7aba-11ea-9510-2274260bc204.png",
      "https://user-images.githubusercontent.com/15864336/78962798-d7212200-7aba-11ea-9d7e-bc22d5276837.png",
      "https://user-images.githubusercontent.com/15864336/78962800-d7b9b880-7aba-11ea-8e53-49a3d20cfbad.png"
    ]
  }
];
