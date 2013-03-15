movie '1.swf' compressed // flash 7, total frames: 5, frame rate: 15 fps, 300x400 px
  
  protect

  frame 0
    constants '_root.loader', '_root', 'loader', '_width', '_root.potty', 'teljes', 'getBytesTotal', 'Math', 'round', 'letoltott', 'getBytesLoaded', 'text', ' / ', ' KB', 'szorzo', '_root.loader.keret', '_root.loader.vonal'  
    ifFrameLoaded 1
      push '_root.loader', X_PROPERTY, 150, '_root'
      getVariable
      push 'loader'
      getMember
      push '_width'
      getMember
      push 2
      divide
      subtract
      setProperty
      push '_root.potty', X_PROPERTY, 150, '_root'
      getVariable
      push 'loader'
      getMember
      push '_width'
      getMember
      push 2
      divide
      subtract
      setProperty
    end // of ifFrameLoaded 1

    push '_root'
    getVariable
    push 'teljes', 0.0, '_root'
    getVariable
    push 'getBytesTotal'
    callMethod
    push 1000
    divide
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    setMember
    push '_root'
    getVariable
    push 'letoltott', 0.0, '_root'
    getVariable
    push 'getBytesLoaded'
    callMethod
    push 1000
    divide
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    setMember
    push '_root'
    getVariable
    push 'text', '_root'
    getVariable
    push 'teljes'
    getMember
    push ' / '
    add
    push '_root'
    getVariable
    push 'letoltott'
    getMember
    add
    push ' KB'
    add
    setMember
    push '_root'
    getVariable
    push 'szorzo', 0.0, '_root'
    getVariable
    push 'getBytesTotal'
    callMethod
    push 300
    divide
    toNumber
    setMember
    push '_root.loader.keret', XSCALE_PROPERTY, 0.0, '_root'
    getVariable
    push 'getBytesTotal'
    callMethod
    push '_root'
    getVariable
    push 'szorzo'
    getMember
    divide
    setProperty
    push '_root.loader.vonal', XSCALE_PROPERTY, 0.0, '_root'
    getVariable
    push 'getBytesLoaded'
    callMethod
    push '_root'
    getVariable
    push 'szorzo'
    getMember
    divide
    setProperty
  end // of frame 0

  frame 0
    ifFrameLoaded 5
      gotoFrame 2
      play
    end // of ifFrameLoaded 5

  end // of frame 0

  frame 0
    constants 'LangCode', 'US-Eng', 'prgVer', '1.0', 'prgAuto', '1', 'fileName', '1.swf', 'prgWidth', '300', 'prgHeight', '400', 'DigSensNum', '6', 'DigActNum', '4', 'AnalogSensNum', '0', 'AnalogActNum', 'ModFok', '2/5', 'HprgLanguage', 'magyar', 'HprgName', 'Tartály', 'HprgLeiras', 'A feltöltő és leengedő szelepek kapcsolgatásával ciklikusan feltöltheti és leengedheti a tartályt, valamint a folyadék hőmérsékletét a fűtés kapcsolgatásával a határértékek között tarthatja. Az összes érzékelő a vezérlés közben is eltolható az egér segítségével.', 'HprgLeiras1', '4 érzékelő a különböző folyadékszintek jelzésére (minimális, maximális, alsó és felső folyadékszint)', 'HprgLeiras2', '2 érzékelő a hőmérsékleti határok jelzésére (minimális és maximális hőmérséklet)', 'HprgLeiras3', '4 végrehajtó a vízmennyiség (gyors betöltő, lassú betöltő valamint leengedő) valamint a hőmérséklet változtatására (fűtés)', 'HprgLeiras4', '', 'HprgLeiras5', 'HprgLeiras6', 'HprgLeiras7', 'HprgLeiras8', 'HprgLeiras9', 'HprgLeiras10', 'HDigSens1', 'Minimális folyadékszint', 'HDigSens2', 'Alsó folyadékszint', 'HDigSens3', 'Felső folyadékszint', 'HDigSens4', 'Maximális folyadékszint', 'HDigSens5', 'Minimális hőmérséklet', 'HDigSens6', 'Maximális hőmérséklet', 'HDigSens7', 'HDigSens8', 'HDigSens9', 'HDigSens10', 'HDigSens11', 'HDigSens12', 'HDigSens13', 'HDigSens14', 'HDigSens15', 'HDigSens16', 'HAnalogSens1', 'HAnalogSens2', 'HDigAct1', 'Gyors befolyást nyitó szelep', 'HDigAct2', 'Lassú befolyást nyitó szelep', 'HDigAct3', 'Folyadékot leengedő szelep', 'HDigAct4', 'Fűtés kapcsoló', 'HDigAct5', 'HDigAct6', 'HDigAct7', 'HDigAct8', 'HDigAct9', 'HDigAct10', 'HDigAct11', 'HDigAct12', 'HDigAct13', 'HDigAct14', 'HDigAct15', 'HDigAct16', 'HAnalogAct1', 'HAnalogAct2', 'EprgLanguage', 'english', 'EprgName', 'Hot water tank', 'EModFok', '**', 'EprgLeiras', 'With the aid of inlet and outlet valves, you can fill and empty the tank cyclically and maintain the water temperature between two limit values. Sensors can also be moved with the mouse with the control operating.', 'EprgLeiras1', '4 sensors for measuring various levels (minimum level, lower level, upper level, maximum level)', 'EprgLeiras2', '2 sensors for temperature measurement (minimum temperature, maximum temperature).', 'EprgLeiras3', '4 actuators for control of temperature and water supply (inlet valve (fast inlet and slow inlet), outlet valve, heating).', 'EprgLeiras4', 'EprgLeiras5', 'EprgLeiras6', 'EprgLeiras7', 'EprgLeiras8', 'EprgLeiras9', 'EprgLeiras10', 'EDigSens1', 'Min. water level', 'EDigSens2', 'Lower water level', 'EDigSens3', 'Upper water level', 'EDigSens4', 'Max. water level', 'EDigSens5', 'Min. temperature', 'EDigSens6', 'Max. temperature', 'EDigSens7', 'EDigSens8', 'EDigSens9', 'EDigSens10', 'EDigSens11', 'EDigSens12', 'EDigSens13', 'EDigSens14', 'EDigSens15', 'EDigSens16', 'EAnalogSens1', 'EAnalogSens2', 'EDigAct1', 'Inlet valve (fast)', 'EDigAct2', 'Inlet valve (slow)', 'EDigAct3', 'Outlet valve', 'EDigAct4', 'Heating', 'EDigAct5', 'EDigAct6', 'EDigAct7', 'EDigAct8', 'EDigAct9', 'EDigAct10', 'EDigAct11', 'EDigAct12', 'EDigAct13', 'EDigAct14', 'EDigAct15', 'EDigAct16', 'EAnalogAct1', 'EAnalogAct2', 'GprgLanguage', 'német', 'GprgName', 'Warmwasserbehälter', 'GModFok', 'GprgLeiras', 'Sie können mit Hilfe von Ein- und Ablassventilen den Behälter zyklisch füllen und entleeren und die Wassertemperatur zwischen zwei Grenzwerten halten. Sensoren sind auch bei laufender Steuerung mit der Maus verschiebbar.', 'GprgLeiras1', '4 Sensoren zur Messung verschiedener Pegelstände (Niedrigstpegel, Unterer Pegel, Oberer Pegel, Höchstpegel)', 'GprgLeiras2', '2 Sensoren zur Temperaturmessung (Niedrigsttemperatur, Höchsttemperatur).', 'GprgLeiras3', '4 Aktoren zur Steuerung von Temperatur und Wasserzufuhr (Einlassventil (schneller Einlass und langsamer Einlass), Ablassventil, Heizung).', 'GprgLeiras4', 'GprgLeiras5', 'GprgLeiras6', 'GprgLeiras7', 'GprgLeiras8', 'GprgLeiras9', 'GprgLeiras10', 'GDigSens1', 'Niedrigstpegel', 'GDigSens2', 'Unterer Pegel', 'GDigSens3', 'Oberer Pegel', 'GDigSens4', 'Höchstpegel', 'GDigSens5', 'Niedrigsttemperatur', 'GDigSens6', 'Höchsttemperatur', 'GDigSens7', 'GDigSens8', 'GDigSens9', 'GDigSens10', 'GDigSens11', 'GDigSens12', 'GDigSens13', 'GDigSens14', 'GDigSens15', 'GDigSens16', 'GAnalogSens1', 'GAnalogSens2', 'GDigAct1', 'Einlaßventil (schneller Einlaß)', 'GDigAct2', 'Einlaßventil (langsamer Einlaß)', 'GDigAct3', 'Ablaßventil', 'GDigAct4', 'Heizung', 'GDigAct5', 'GDigAct6', 'GDigAct7', 'GDigAct8', 'GDigAct9', 'GDigAct10', 'GDigAct11', 'GDigAct12', 'GDigAct13', 'GDigAct14', 'GDigAct15', 'GDigAct16', 'GAnalogAct1', 'GAnalogAct2', 'NprgLanguage', 'norwegian', 'NprgName', 'Tank', 'NprgLeiras', 'NDigSens1', 'Min. vannivå', 'NDigSens2', 'Senk vannivå', 'NDigSens3', 'Hev vannivå', 'NDigSens4', 'Maks. vannivå', 'NDigSens5', 'Min. temperatur', 'NDigSens6', 'Maks. temperatur', 'NDigSens7', 'NDigSens8', 'NDigSens9', 'NDigSens10', 'NDigSens11', 'NDigSens12', 'NDigSens13', 'NDigSens14', 'NDigSens15', 'NDigSens16', 'NAnalogSens1', 'NAnalogSens2', 'NDigAct1', 'Fylleventil (hurtig)', 'NDigAct2', 'Fylleventil (langsomt)', 'NDigAct3', 'Tømmeventil', 'NDigAct4', 'Varme', 'NDigAct5', 'NDigAct6', 'NDigAct7', 'NDigAct8', 'NDigAct9', 'NDigAct10', 'NDigAct11', 'NDigAct12', 'NDigAct13', 'NDigAct14', 'NDigAct15', 'NDigAct16', 'NAnalogAct1', 'NAnalogAct2', 'FprgLanguage', 'Frence', 'FprgName', 'Citerne d’eau chaude', 'FprgLeiras', 'FDigSens1', 'Niveau minimum', 'FDigSens2', 'Niveau bas', 'FDigSens3', 'Niveau haut', 'FDigSens4', 'Niveau maximum', 'FDigSens5', 'Température minimum', 'FDigSens6', 'Température maximum', 'FDigSens7', 'FDigSens8', 'FDigSens9', 'FDigSens10', 'FDigSens11', 'FDigSens12', 'FDigSens13', 'FDigSens14', 'FDigSens15', 'FDigSens16', 'FAnalogSens1', 'FAnalogSens2', 'FDigAct1', 'Vanne pour entrée rapide', 'FDigAct2', 'Vanne pour entrée lente', 'FDigAct3', 'Vanne de vidange', 'FDigAct4', 'Enclenchement du chauffage', 'FDigAct5', 'FDigAct6', 'FDigAct7', 'FDigAct8', 'FDigAct9', 'FDigAct10', 'FDigAct11', 'FDigAct12', 'FDigAct13', 'FDigAct14', 'FDigAct15', 'FDigAct16', 'FAnalogAct1', 'FAnalogAct2', 'Vous pouvez à l’aide de vannes d’admission/évacuation d’eau remplir et vider cycliquement la citerne ainsi que maintenir la température entre deux valeurs définies. Les capteurs peuvent être déplacés pendant la simulation à l’aide de la souris.', 'FprgLeiras1', '4 capteurs indiquent le niveau de liquide minimum, inférieur, supérieur et maximum.', 'FprgLeiras2', '2 détecteurs de température pour les valeurs minimales et maximales.', 'FprgLeiras3', '4 actuateurs pour commander le niveau d’eau ainsi que les températures. (vannes d’admission (admission rapide, admission lente), vanne d’évacuation, chauffage).', 'FprgLeiras4', 'FprgLeiras5', 'FprgLeiras6', 'FprgLeiras7', 'FprgLeiras8', 'FprgLeiras9', 'FprgLeiras10', 'SprgLanguage', 'Spanish', 'SprgName', 'Depósito de agua caliente', 'SprgLeiras', 'SDigSens1', 'Nivel mínimo del agua', 'SDigSens2', 'Nivel inferior del agua', 'SDigSens3', 'Nivel superior del agua', 'SDigSens4', 'Nivel máximo del agua', 'SDigSens5', 'Temperatura mínima', 'SDigSens6', 'Temperatura máxima', 'SDigSens7', 'SDigSens8', 'SDigSens9', 'SDigSens10', 'SDigSens11', 'SDigSens12', 'SDigSens13', 'SDigSens14', 'SDigSens15', 'SDigSens16', 'SAnalogSens1', 'SAnalogSens2', 'SDigAct1', 'Válvula de aspiración rápida', 'SDigAct2', 'Válvula de aspiración lenta', 'SDigAct3', 'Válvula para la evacuación del líquido', 'SDigAct4', 'Selector del calentamiento', 'SDigAct5', 'SDigAct6', 'SDigAct7', 'SDigAct8', 'SDigAct9', 'SDigAct10', 'SDigAct11', 'SDigAct12', 'SDigAct13', 'SDigAct14', 'SDigAct15', 'SDigAct16', 'SAnalogAct1', 'SAnalogAct2', 'Mediante las válvulas de aspiración y de evacuación puede llenar y vaciarse el depósito de manera cíclica, y puede mantenerse la temperatura del líquido entre los valores límites conmutando el selector del calentamiento. Con el mouse los sensores pueden desplazarse incluso durante el control.', 'SprgLeiras1', '4 sensores para indicar los distintos niveles del líquido (mínimo, máximo, inferior y superior respectivamente)', 'SprgLeiras2', '2 sensores para indicar los límites de la temperatura (mínimo y máximo, respectivamente)', 'SprgLeiras3', '4 manipuladores para cambiar la cantidad del agua (válvula de aspiración rápida y lenta del agua, así como para la evacuación de la misma) y de la temperatura (selector del calentamiento)', 'SprgLeiras4', 'SprgLeiras5', 'SprgLeiras6', 'SprgLeiras7', 'SprgLeiras8', 'SprgLeiras9', 'SprgLeiras10', 'SWprgLanguage', 'svedish', 'SWprgName', 'Varmvattentank', 'SWModFok', 'SWprgLeiras', 'Med hjälp av in- och utloppsventiler kan tanken fyllas och tömmas cykliskt samt bibehålla temperaturen mellan två gränsvärden. Givare kan flyttas med musen i driftläge.', 'SWprgLeiras1', 'Tanken är utrustad med 4 nivågivare, för miniminivå, låg nivå, hög nivå och maximal nivå.', 'SWprgLeiras2', 'Det finns 2 givare för temperaturmätning, för minimitemperatur och maximitemperatur.', 'SWprgLeiras3', '4 ställdon för reglering av vattenflöde och temperatur. En inloppsventil för snabbt och en för långsamt tillflöde samt en utflödesventil. För uppvärmning är tanken utrustad med en värmeslinga.', 'SWprgLeiras4', 'SWprgLeiras5', 'SWprgLeiras6', 'SWprgLeiras7', 'SWprgLeiras8', 'SWprgLeiras9', 'SWprgLeiras10', 'SWDigSens1', 'Min. vattennivå', 'SWDigSens2', 'Nedre vattennivå', 'SWDigSens3', 'Övre vattennivå', 'SWDigSens4', 'Max. vattennivå', 'SWDigSens5', 'SWDigSens6', 'Max. temperatur', 'SWDigSens7', 'SWDigSens8', 'SWDigSens9', 'SWDigSens10', 'SWDigSens11', 'SWDigSens12', 'SWDigSens13', 'SWDigSens14', 'SWDigSens15', 'SWDigSens16', 'SWAnalogSens1', 'SWAnalogSens2', 'SWDigAct1', 'Inloppsventil (snabb)', 'SWDigAct2', 'Inloppsventil (långsam)', 'SWDigAct3', 'Utloppsventil', 'SWDigAct4', 'Uppvärmning', 'SWDigAct5', 'SWDigAct6', 'SWDigAct7', 'SWDigAct8', 'SWDigAct9', 'SWDigAct10', 'SWDigAct11', 'SWDigAct12', 'SWDigAct13', 'SWDigAct14', 'SWDigAct15', 'SWDigAct16', 'SWAnalogAct1', 'SWAnalogAct2'  
    push 'LangCode', 'US-Eng'
    setVariable
    push 'prgVer', '1.0'
    setVariable
    push 'prgAuto', '1'
    setVariable
    push 'fileName', '1.swf'
    setVariable
    push 'prgWidth', '300'
    setVariable
    push 'prgHeight', '400'
    setVariable
    push 'DigSensNum', '6'
    setVariable
    push 'DigActNum', '4'
    setVariable
    push 'AnalogSensNum', '0'
    setVariable
    push 'AnalogActNum', '0'
    setVariable
    push 'ModFok', '2/5'
    setVariable
    push 'HprgLanguage', 'magyar'
    setVariable
    push 'HprgName', 'Tartály'
    setVariable
    push 'HprgLeiras', 'A feltöltő és leengedő szelepek kapcsolgatásával ciklikusan feltöltheti és leengedheti a tartályt, valamint a folyadék hőmérsékletét a fűtés kapcsolgatásával a határértékek között tarthatja. Az összes érzékelő a vezérlés közben is eltolható az egér segítségével.'
    setVariable
    push 'HprgLeiras1', '4 érzékelő a különböző folyadékszintek jelzésére (minimális, maximális, alsó és felső folyadékszint)'
    setVariable
    push 'HprgLeiras2', '2 érzékelő a hőmérsékleti határok jelzésére (minimális és maximális hőmérséklet)'
    setVariable
    push 'HprgLeiras3', '4 végrehajtó a vízmennyiség (gyors betöltő, lassú betöltő valamint leengedő) valamint a hőmérséklet változtatására (fűtés)'
    setVariable
    push 'HprgLeiras4', ''
    setVariable
    push 'HprgLeiras5', ''
    setVariable
    push 'HprgLeiras6', ''
    setVariable
    push 'HprgLeiras7', ''
    setVariable
    push 'HprgLeiras8', ''
    setVariable
    push 'HprgLeiras9', ''
    setVariable
    push 'HprgLeiras10', ''
    setVariable
    push 'HDigSens1', 'Minimális folyadékszint'
    setVariable
    push 'HDigSens2', 'Alsó folyadékszint'
    setVariable
    push 'HDigSens3', 'Felső folyadékszint'
    setVariable
    push 'HDigSens4', 'Maximális folyadékszint'
    setVariable
    push 'HDigSens5', 'Minimális hőmérséklet'
    setVariable
    push 'HDigSens6', 'Maximális hőmérséklet'
    setVariable
    push 'HDigSens7', ''
    setVariable
    push 'HDigSens8', ''
    setVariable
    push 'HDigSens9', ''
    setVariable
    push 'HDigSens10', ''
    setVariable
    push 'HDigSens11', ''
    setVariable
    push 'HDigSens12', ''
    setVariable
    push 'HDigSens13', ''
    setVariable
    push 'HDigSens14', ''
    setVariable
    push 'HDigSens15', ''
    setVariable
    push 'HDigSens16', ''
    setVariable
    push 'HAnalogSens1', ''
    setVariable
    push 'HAnalogSens2', ''
    setVariable
    push 'HDigAct1', 'Gyors befolyást nyitó szelep'
    setVariable
    push 'HDigAct2', 'Lassú befolyást nyitó szelep'
    setVariable
    push 'HDigAct3', 'Folyadékot leengedő szelep'
    setVariable
    push 'HDigAct4', 'Fűtés kapcsoló'
    setVariable
    push 'HDigAct5', ''
    setVariable
    push 'HDigAct6', ''
    setVariable
    push 'HDigAct7', ''
    setVariable
    push 'HDigAct8', ''
    setVariable
    push 'HDigAct9', ''
    setVariable
    push 'HDigAct10', ''
    setVariable
    push 'HDigAct11', ''
    setVariable
    push 'HDigAct12', ''
    setVariable
    push 'HDigAct13', ''
    setVariable
    push 'HDigAct14', ''
    setVariable
    push 'HDigAct15', ''
    setVariable
    push 'HDigAct16', ''
    setVariable
    push 'HAnalogAct1', ''
    setVariable
    push 'HAnalogAct2', ''
    setVariable
    push 'EprgLanguage', 'english'
    setVariable
    push 'EprgName', 'Hot water tank'
    setVariable
    push 'EModFok', '**'
    setVariable
    push 'EprgLeiras', 'With the aid of inlet and outlet valves, you can fill and empty the tank cyclically and maintain the water temperature between two limit values. Sensors can also be moved with the mouse with the control operating.'
    setVariable
    push 'EprgLeiras1', '4 sensors for measuring various levels (minimum level, lower level, upper level, maximum level)'
    setVariable
    push 'EprgLeiras2', '2 sensors for temperature measurement (minimum temperature, maximum temperature).'
    setVariable
    push 'EprgLeiras3', '4 actuators for control of temperature and water supply (inlet valve (fast inlet and slow inlet), outlet valve, heating).'
    setVariable
    push 'EprgLeiras4', ''
    setVariable
    push 'EprgLeiras5', ''
    setVariable
    push 'EprgLeiras6', ''
    setVariable
    push 'EprgLeiras7', ''
    setVariable
    push 'EprgLeiras8', ''
    setVariable
    push 'EprgLeiras9', ''
    setVariable
    push 'EprgLeiras10', ''
    setVariable
    push 'EDigSens1', 'Min. water level'
    setVariable
    push 'EDigSens2', 'Lower water level'
    setVariable
    push 'EDigSens3', 'Upper water level'
    setVariable
    push 'EDigSens4', 'Max. water level'
    setVariable
    push 'EDigSens5', 'Min. temperature'
    setVariable
    push 'EDigSens6', 'Max. temperature'
    setVariable
    push 'EDigSens7', ''
    setVariable
    push 'EDigSens8', ''
    setVariable
    push 'EDigSens9', ''
    setVariable
    push 'EDigSens10', ''
    setVariable
    push 'EDigSens11', ''
    setVariable
    push 'EDigSens12', ''
    setVariable
    push 'EDigSens13', ''
    setVariable
    push 'EDigSens14', ''
    setVariable
    push 'EDigSens15', ''
    setVariable
    push 'EDigSens16', ''
    setVariable
    push 'EAnalogSens1', ''
    setVariable
    push 'EAnalogSens2', ''
    setVariable
    push 'EDigAct1', 'Inlet valve (fast)'
    setVariable
    push 'EDigAct2', 'Inlet valve (slow)'
    setVariable
    push 'EDigAct3', 'Outlet valve'
    setVariable
    push 'EDigAct4', 'Heating'
    setVariable
    push 'EDigAct5', ''
    setVariable
    push 'EDigAct6', ''
    setVariable
    push 'EDigAct7', ''
    setVariable
    push 'EDigAct8', ''
    setVariable
    push 'EDigAct9', ''
    setVariable
    push 'EDigAct10', ''
    setVariable
    push 'EDigAct11', ''
    setVariable
    push 'EDigAct12', ''
    setVariable
    push 'EDigAct13', ''
    setVariable
    push 'EDigAct14', ''
    setVariable
    push 'EDigAct15', ''
    setVariable
    push 'EDigAct16', ''
    setVariable
    push 'EAnalogAct1', ''
    setVariable
    push 'EAnalogAct2', ''
    setVariable
    push 'GprgLanguage', 'német'
    setVariable
    push 'GprgName', 'Warmwasserbehälter'
    setVariable
    push 'GModFok', '**'
    setVariable
    push 'GprgLeiras', 'Sie können mit Hilfe von Ein- und Ablassventilen den Behälter zyklisch füllen und entleeren und die Wassertemperatur zwischen zwei Grenzwerten halten. Sensoren sind auch bei laufender Steuerung mit der Maus verschiebbar.'
    setVariable
    push 'GprgLeiras1', '4 Sensoren zur Messung verschiedener Pegelstände (Niedrigstpegel, Unterer Pegel, Oberer Pegel, Höchstpegel)'
    setVariable
    push 'GprgLeiras2', '2 Sensoren zur Temperaturmessung (Niedrigsttemperatur, Höchsttemperatur).'
    setVariable
    push 'GprgLeiras3', '4 Aktoren zur Steuerung von Temperatur und Wasserzufuhr (Einlassventil (schneller Einlass und langsamer Einlass), Ablassventil, Heizung).'
    setVariable
    push 'GprgLeiras4', ''
    setVariable
    push 'GprgLeiras5', ''
    setVariable
    push 'GprgLeiras6', ''
    setVariable
    push 'GprgLeiras7', ''
    setVariable
    push 'GprgLeiras8', ''
    setVariable
    push 'GprgLeiras9', ''
    setVariable
    push 'GprgLeiras10', ''
    setVariable
    push 'GDigSens1', 'Niedrigstpegel'
    setVariable
    push 'GDigSens2', 'Unterer Pegel'
    setVariable
    push 'GDigSens3', 'Oberer Pegel'
    setVariable
    push 'GDigSens4', 'Höchstpegel'
    setVariable
    push 'GDigSens5', 'Niedrigsttemperatur'
    setVariable
    push 'GDigSens6', 'Höchsttemperatur'
    setVariable
    push 'GDigSens7', ''
    setVariable
    push 'GDigSens8', ''
    setVariable
    push 'GDigSens9', ''
    setVariable
    push 'GDigSens10', ''
    setVariable
    push 'GDigSens11', ''
    setVariable
    push 'GDigSens12', ''
    setVariable
    push 'GDigSens13', ''
    setVariable
    push 'GDigSens14', ''
    setVariable
    push 'GDigSens15', ''
    setVariable
    push 'GDigSens16', ''
    setVariable
    push 'GAnalogSens1', ''
    setVariable
    push 'GAnalogSens2', ''
    setVariable
    push 'GDigAct1', 'Einlaßventil (schneller Einlaß)'
    setVariable
    push 'GDigAct2', 'Einlaßventil (langsamer Einlaß)'
    setVariable
    push 'GDigAct3', 'Ablaßventil'
    setVariable
    push 'GDigAct4', 'Heizung'
    setVariable
    push 'GDigAct5', ''
    setVariable
    push 'GDigAct6', ''
    setVariable
    push 'GDigAct7', ''
    setVariable
    push 'GDigAct8', ''
    setVariable
    push 'GDigAct9', ''
    setVariable
    push 'GDigAct10', ''
    setVariable
    push 'GDigAct11', ''
    setVariable
    push 'GDigAct12', ''
    setVariable
    push 'GDigAct13', ''
    setVariable
    push 'GDigAct14', ''
    setVariable
    push 'GDigAct15', ''
    setVariable
    push 'GDigAct16', ''
    setVariable
    push 'GAnalogAct1', ''
    setVariable
    push 'GAnalogAct2', ''
    setVariable
    push 'NprgLanguage', 'norwegian'
    setVariable
    push 'NprgName', 'Tank'
    setVariable
    push 'NprgLeiras', ''
    setVariable
    push 'NDigSens1', 'Min. vannivå'
    setVariable
    push 'NDigSens2', 'Senk vannivå'
    setVariable
    push 'NDigSens3', 'Hev vannivå'
    setVariable
    push 'NDigSens4', 'Maks. vannivå'
    setVariable
    push 'NDigSens5', 'Min. temperatur'
    setVariable
    push 'NDigSens6', 'Maks. temperatur'
    setVariable
    push 'NDigSens7', ''
    setVariable
    push 'NDigSens8', ''
    setVariable
    push 'NDigSens9', ''
    setVariable
    push 'NDigSens10', ''
    setVariable
    push 'NDigSens11', ''
    setVariable
    push 'NDigSens12', ''
    setVariable
    push 'NDigSens13', ''
    setVariable
    push 'NDigSens14', ''
    setVariable
    push 'NDigSens15', ''
    setVariable
    push 'NDigSens16', ''
    setVariable
    push 'NAnalogSens1', ''
    setVariable
    push 'NAnalogSens2', ''
    setVariable
    push 'NDigAct1', 'Fylleventil (hurtig)'
    setVariable
    push 'NDigAct2', 'Fylleventil (langsomt)'
    setVariable
    push 'NDigAct3', 'Tømmeventil'
    setVariable
    push 'NDigAct4', 'Varme'
    setVariable
    push 'NDigAct5', ''
    setVariable
    push 'NDigAct6', ''
    setVariable
    push 'NDigAct7', ''
    setVariable
    push 'NDigAct8', ''
    setVariable
    push 'NDigAct9', ''
    setVariable
    push 'NDigAct10', ''
    setVariable
    push 'NDigAct11', ''
    setVariable
    push 'NDigAct12', ''
    setVariable
    push 'NDigAct13', ''
    setVariable
    push 'NDigAct14', ''
    setVariable
    push 'NDigAct15', ''
    setVariable
    push 'NDigAct16', ''
    setVariable
    push 'NAnalogAct1', ''
    setVariable
    push 'NAnalogAct2', ''
    setVariable
    push 'FprgLanguage', 'Frence'
    setVariable
    push 'FprgName', 'Citerne d’eau chaude'
    setVariable
    push 'FprgLeiras', ''
    setVariable
    push 'FDigSens1', 'Niveau minimum'
    setVariable
    push 'FDigSens2', 'Niveau bas'
    setVariable
    push 'FDigSens3', 'Niveau haut'
    setVariable
    push 'FDigSens4', 'Niveau maximum'
    setVariable
    push 'FDigSens5', 'Température minimum'
    setVariable
    push 'FDigSens6', 'Température maximum'
    setVariable
    push 'FDigSens7', ''
    setVariable
    push 'FDigSens8', ''
    setVariable
    push 'FDigSens9', ''
    setVariable
    push 'FDigSens10', ''
    setVariable
    push 'FDigSens11', ''
    setVariable
    push 'FDigSens12', ''
    setVariable
    push 'FDigSens13', ''
    setVariable
    push 'FDigSens14', ''
    setVariable
    push 'FDigSens15', ''
    setVariable
    push 'FDigSens16', ''
    setVariable
    push 'FAnalogSens1', ''
    setVariable
    push 'FAnalogSens2', ''
    setVariable
    push 'FDigAct1', 'Vanne pour entrée rapide'
    setVariable
    push 'FDigAct2', 'Vanne pour entrée lente'
    setVariable
    push 'FDigAct3', 'Vanne de vidange'
    setVariable
    push 'FDigAct4', 'Enclenchement du chauffage'
    setVariable
    push 'FDigAct5', ''
    setVariable
    push 'FDigAct6', ''
    setVariable
    push 'FDigAct7', ''
    setVariable
    push 'FDigAct8', ''
    setVariable
    push 'FDigAct9', ''
    setVariable
    push 'FDigAct10', ''
    setVariable
    push 'FDigAct11', ''
    setVariable
    push 'FDigAct12', ''
    setVariable
    push 'FDigAct13', ''
    setVariable
    push 'FDigAct14', ''
    setVariable
    push 'FDigAct15', ''
    setVariable
    push 'FDigAct16', ''
    setVariable
    push 'FAnalogAct1', ''
    setVariable
    push 'FAnalogAct2', ''
    setVariable
    push 'FprgLeiras', 'Vous pouvez à l’aide de vannes d’admission/évacuation d’eau remplir et vider cycliquement la citerne ainsi que maintenir la température entre deux valeurs définies. Les capteurs peuvent être déplacés pendant la simulation à l’aide de la souris.'
    setVariable
    push 'FprgLeiras1', '4 capteurs indiquent le niveau de liquide minimum, inférieur, supérieur et maximum.'
    setVariable
    push 'FprgLeiras2', '2 détecteurs de température pour les valeurs minimales et maximales.'
    setVariable
    push 'FprgLeiras3', '4 actuateurs pour commander le niveau d’eau ainsi que les températures. (vannes d’admission (admission rapide, admission lente), vanne d’évacuation, chauffage).'
    setVariable
    push 'FprgLeiras4', ''
    setVariable
    push 'FprgLeiras5', ''
    setVariable
    push 'FprgLeiras6', ''
    setVariable
    push 'FprgLeiras7', ''
    setVariable
    push 'FprgLeiras8', ''
    setVariable
    push 'FprgLeiras9', ''
    setVariable
    push 'FprgLeiras10', ''
    setVariable
    push 'SprgLanguage', 'Spanish'
    setVariable
    push 'SprgName', 'Depósito de agua caliente'
    setVariable
    push 'SprgLeiras', ''
    setVariable
    push 'SDigSens1', 'Nivel mínimo del agua'
    setVariable
    push 'SDigSens2', 'Nivel inferior del agua'
    setVariable
    push 'SDigSens3', 'Nivel superior del agua'
    setVariable
    push 'SDigSens4', 'Nivel máximo del agua'
    setVariable
    push 'SDigSens5', 'Temperatura mínima'
    setVariable
    push 'SDigSens6', 'Temperatura máxima'
    setVariable
    push 'SDigSens7', ''
    setVariable
    push 'SDigSens8', ''
    setVariable
    push 'SDigSens9', ''
    setVariable
    push 'SDigSens10', ''
    setVariable
    push 'SDigSens11', ''
    setVariable
    push 'SDigSens12', ''
    setVariable
    push 'SDigSens13', ''
    setVariable
    push 'SDigSens14', ''
    setVariable
    push 'SDigSens15', ''
    setVariable
    push 'SDigSens16', ''
    setVariable
    push 'SAnalogSens1', ''
    setVariable
    push 'SAnalogSens2', ''
    setVariable
    push 'SDigAct1', 'Válvula de aspiración rápida'
    setVariable
    push 'SDigAct2', 'Válvula de aspiración lenta'
    setVariable
    push 'SDigAct3', 'Válvula para la evacuación del líquido'
    setVariable
    push 'SDigAct4', 'Selector del calentamiento'
    setVariable
    push 'SDigAct5', ''
    setVariable
    push 'SDigAct6', ''
    setVariable
    push 'SDigAct7', ''
    setVariable
    push 'SDigAct8', ''
    setVariable
    push 'SDigAct9', ''
    setVariable
    push 'SDigAct10', ''
    setVariable
    push 'SDigAct11', ''
    setVariable
    push 'SDigAct12', ''
    setVariable
    push 'SDigAct13', ''
    setVariable
    push 'SDigAct14', ''
    setVariable
    push 'SDigAct15', ''
    setVariable
    push 'SDigAct16', ''
    setVariable
    push 'SAnalogAct1', ''
    setVariable
    push 'SAnalogAct2', ''
    setVariable
    push 'SprgLeiras', 'Mediante las válvulas de aspiración y de evacuación puede llenar y vaciarse el depósito de manera cíclica, y puede mantenerse la temperatura del líquido entre los valores límites conmutando el selector del calentamiento. Con el mouse los sensores pueden desplazarse incluso durante el control.'
    setVariable
    push 'SprgLeiras1', '4 sensores para indicar los distintos niveles del líquido (mínimo, máximo, inferior y superior respectivamente)'
    setVariable
    push 'SprgLeiras2', '2 sensores para indicar los límites de la temperatura (mínimo y máximo, respectivamente)'
    setVariable
    push 'SprgLeiras3', '4 manipuladores para cambiar la cantidad del agua (válvula de aspiración rápida y lenta del agua, así como para la evacuación de la misma) y de la temperatura (selector del calentamiento)'
    setVariable
    push 'SprgLeiras4', ''
    setVariable
    push 'SprgLeiras5', ''
    setVariable
    push 'SprgLeiras6', ''
    setVariable
    push 'SprgLeiras7', ''
    setVariable
    push 'SprgLeiras8', ''
    setVariable
    push 'SprgLeiras9', ''
    setVariable
    push 'SprgLeiras10', ''
    setVariable
    push 'SWprgLanguage', 'svedish'
    setVariable
    push 'SWprgName', 'Varmvattentank'
    setVariable
    push 'SWModFok', '**'
    setVariable
    push 'SWprgLeiras', 'Med hjälp av in- och utloppsventiler kan tanken fyllas och tömmas cykliskt samt bibehålla temperaturen mellan två gränsvärden. Givare kan flyttas med musen i driftläge.'
    setVariable
    push 'SWprgLeiras1', 'Tanken är utrustad med 4 nivågivare, för miniminivå, låg nivå, hög nivå och maximal nivå.'
    setVariable
    push 'SWprgLeiras2', 'Det finns 2 givare för temperaturmätning, för minimitemperatur och maximitemperatur.'
    setVariable
    push 'SWprgLeiras3', '4 ställdon för reglering av vattenflöde och temperatur. En inloppsventil för snabbt och en för långsamt tillflöde samt en utflödesventil. För uppvärmning är tanken utrustad med en värmeslinga.'
    setVariable
    push 'SWprgLeiras4', ''
    setVariable
    push 'SWprgLeiras5', ''
    setVariable
    push 'SWprgLeiras6', ''
    setVariable
    push 'SWprgLeiras7', ''
    setVariable
    push 'SWprgLeiras8', ''
    setVariable
    push 'SWprgLeiras9', ''
    setVariable
    push 'SWprgLeiras10', ''
    setVariable
    push 'SWDigSens1', 'Min. vattennivå'
    setVariable
    push 'SWDigSens2', 'Nedre vattennivå'
    setVariable
    push 'SWDigSens3', 'Övre vattennivå'
    setVariable
    push 'SWDigSens4', 'Max. vattennivå'
    setVariable
    push 'SWDigSens5', 'Min. temperatur'
    setVariable
    push 'SWDigSens6', 'Max. temperatur'
    setVariable
    push 'SWDigSens7', ''
    setVariable
    push 'SWDigSens8', ''
    setVariable
    push 'SWDigSens9', ''
    setVariable
    push 'SWDigSens10', ''
    setVariable
    push 'SWDigSens11', ''
    setVariable
    push 'SWDigSens12', ''
    setVariable
    push 'SWDigSens13', ''
    setVariable
    push 'SWDigSens14', ''
    setVariable
    push 'SWDigSens15', ''
    setVariable
    push 'SWDigSens16', ''
    setVariable
    push 'SWAnalogSens1', ''
    setVariable
    push 'SWAnalogSens2', ''
    setVariable
    push 'SWDigAct1', 'Inloppsventil (snabb)'
    setVariable
    push 'SWDigAct2', 'Inloppsventil (långsam)'
    setVariable
    push 'SWDigAct3', 'Utloppsventil'
    setVariable
    push 'SWDigAct4', 'Uppvärmning'
    setVariable
    push 'SWDigAct5', ''
    setVariable
    push 'SWDigAct6', ''
    setVariable
    push 'SWDigAct7', ''
    setVariable
    push 'SWDigAct8', ''
    setVariable
    push 'SWDigAct9', ''
    setVariable
    push 'SWDigAct10', ''
    setVariable
    push 'SWDigAct11', ''
    setVariable
    push 'SWDigAct12', ''
    setVariable
    push 'SWDigAct13', ''
    setVariable
    push 'SWDigAct14', ''
    setVariable
    push 'SWDigAct15', ''
    setVariable
    push 'SWDigAct16', ''
    setVariable
    push 'SWAnalogAct1', ''
    setVariable
    push 'SWAnalogAct2', ''
    setVariable
  end // of frame 0

  defineMovieClip 4 // total frames: 1
  end // of defineMovieClip 4

  defineMovieClip 6 // total frames: 1
  end // of defineMovieClip 6

  defineMovieClip 7 // total frames: 1
  end // of defineMovieClip 7

  defineMovieClip 9 // total frames: 35
  end // of defineMovieClip 9

  frame 1
    gotoFrame 0
    play
  end // of frame 1

  frame 2
    push 'oszlop', 0.0
    setVariable
    push 'homers_no', 0.4
    setVariable
    push 'homers_csokk', 0.1
    setVariable
    push 'homers_max', 100
    setVariable
    push 'homers_akt', 50
    setVariable
    push 'homers_min', 0.0
    setVariable
    push 'fok', 0.0
    setVariable
    push 'sebesseg', 0.2
    setVariable
    push 'DA1', 0.0
    setVariable
    push 'DA2', 0.0
    setVariable
    push 'DA3', 0.0
    setVariable
    push 'DS1', 0.0
    setVariable
    push 'DS2', 0.0
    setVariable
    push 'DS3', 0.0
    setVariable
    push 'DS4', 0.0
    setVariable
    push 'AS1', 0.0
    setVariable
    push 'AS2', 0.0
    setVariable
    push 'hozam', 0.0
    setVariable
    push 'a', 435
    setVariable
    push '/1S/csgomb', Y_PROPERTY, '50'
    setProperty
    push '/2S/csgomb', Y_PROPERTY, '30'
    setProperty
    push '/3S/csgomb', Y_PROPERTY, '-30'
    setProperty
    push '/4S/csgomb', Y_PROPERTY, '-50'
    setProperty
    push 'DA1Hozam', 3
    setVariable
    push 'DA2Hozam', 1
    setVariable
    push 'DA3Hozam', -2
    setVariable
    gotoLabel 'start'
    play
  end // of frame 2

  frame 2
    push '_root.homers_akt_min.csgomb', X_PROPERTY, -20
    setProperty
    push '_root.homers_akt_max.csgomb', X_PROPERTY, 30
    setProperty
  end // of frame 2

  defineMovieClip 13 // total frames: 1
  end // of defineMovieClip 13

  defineMovieClip 15 // total frames: 3
  end // of defineMovieClip 15

  defineMovieClip 18 // total frames: 1
  end // of defineMovieClip 18

  defineButton 20

    on overUpToOverDown
      constants '../vonal', 'this'  
      push '../vonal', 0.0
      getProperty
      push '../vonal', 8
      getProperty
      push 2
      divide
      add
      push 0.5
      add
      push '../vonal', 1
      getProperty
      push '../vonal', 0.0
      getProperty
      push '../vonal', 8
      getProperty
      push 2
      divide
      subtract
      push 0.5
      subtract
      push '../vonal', 1
      getProperty
      push 1, 0.0, 'this'
      getVariable
      startDrag
    end

    on overDownToOverUp,outDownToIdle
      stopDrag
    end
  end // of defineButton 20

  defineMovieClip 21 // total frames: 1
  end // of defineMovieClip 21

  defineMovieClip 22 // total frames: 2

    frame 0
      constants 'csgomb', '_x', 'Math', 'round', '_root', ''  
      push 0.0, 'csgomb'
      getVariable
      push '_x'
      getMember
      subtract
      push 50
      add
      push 1, 'Math'
      getVariable
      push 'round'
      callMethod
      push 0.0
      lessThan
      not
      branchIfTrue label1
      push '_root'
      getVariable
      push '', 13
      getProperty
      push 100
      setMember
      branch label2
     label1:
      push '_root'
      getVariable
      push '', 13
      getProperty
      push 100, 0.0, 'csgomb'
      getVariable
      push '_x'
      getMember
      subtract
      push 50
      add
      int
      subtract
      setMember
     label2:
    end // of frame 0
  end // of defineMovieClip 22

  defineMovieClip 26 // total frames: 15
  end // of defineMovieClip 26

  defineButton 28

    on overUpToOverDown
      constants '../vonal', 'this'  
      push '../vonal', 0.0
      getProperty
      push '../vonal', 1
      getProperty
      push '../vonal', 9
      getProperty
      push 2
      divide
      add
      push 0.5
      add
      push '../vonal', 0.0
      getProperty
      push '../vonal', 1
      getProperty
      push '../vonal', 9
      getProperty
      push 2
      divide
      subtract
      push 0.5
      subtract
      push 1, 0.0, 'this'
      getVariable
      startDrag
    end

    on overDownToOverUp,outDownToIdle
      stopDrag
    end
  end // of defineButton 28

  defineMovieClip 29 // total frames: 1
  end // of defineMovieClip 29

  defineMovieClip 30 // total frames: 1
  end // of defineMovieClip 30

  defineMovieClip 31 // total frames: 2

    frame 0
      constants 'csgomb', '_y', 'Math', 'round', '_root', 'DS', ''  
      push 0.0, 'csgomb'
      getVariable
      push '_y'
      getMember
      subtract
      push 127
      add
      push 1, 'Math'
      getVariable
      push 'round'
      callMethod
      push 0.0
      lessThan
      not
      branchIfTrue label1
      push '_root'
      getVariable
      push 'DS', '', 13
      getProperty
      add
      push 0.0
      setMember
      branch label2
     label1:
      push '_root'
      getVariable
      push 'DS', '', 13
      getProperty
      add
      push 0.0, 'csgomb'
      getVariable
      push '_y'
      getMember
      subtract
      push 127
      add
      int
      setMember
     label2:
    end // of frame 0
  end // of defineMovieClip 31

  frame 3
    constants '_root.d_homers', '_root', 'fok', '_this', '_x', 'homers_akt_min', 'DS5', 'homers_akt_max', 'DS6'  
    push '_root.d_homers', XSCALE_PROPERTY, '_root'
    getVariable
    push 'fok'
    getMember
    setProperty
    push '_root.d_homers', X_PROPERTY, '_this'
    getVariable
    push '_x'
    getMember
    setProperty
    push '_root'
    getVariable
    push 'homers_akt_min'
    getMember
    push 'fok'
    getVariable
    greaterThan
    not
    not
    branchIfTrue label1
    push '_root'
    getVariable
    push 'DS5', 1
    setMember
    branch label2
   label1:
    push '_root'
    getVariable
    push 'DS5', 0.0
    setMember
   label2:
    push '_root'
    getVariable
    push 'homers_akt_max'
    getMember
    push 'fok'
    getVariable
    greaterThan
    not
    not
    branchIfTrue label3
    push '_root'
    getVariable
    push 'DS6', 1
    setMember
    branch label4
   label3:
    push '_root'
    getVariable
    push 'DS6', 0.0
    setMember
   label4:
  end // of frame 3

  frame 3
    constants '_root', 'auto', 'DS1', 'DS2', 'DS3', 'DS4', 'DA1', '1', 'DA2', 'DA3', '0', 'DS5', 'DA4', 'DS6'  
    push '_root'
    getVariable
    push 'auto'
    getMember
    push 1
    equals
    not
    branchIfTrue label7
    push '_root'
    getVariable
    push 'DS1'
    getMember
    push 0.0
    equals
    push '_root'
    getVariable
    push 'DS2'
    getMember
    push 0.0
    equals
    and
    push '_root'
    getVariable
    push 'DS3'
    getMember
    push 0.0
    equals
    and
    push '_root'
    getVariable
    push 'DS4'
    getMember
    push 0.0
    equals
    and
    not
    branchIfTrue label1
    push '_root'
    getVariable
    push 'DA1', '1'
    setMember
    push '_root'
    getVariable
    push 'DA2', '1'
    setMember
    push '_root'
    getVariable
    push 'DA3', '0'
    setMember
   label1:
    push '_root'
    getVariable
    push 'DS1'
    getMember
    push 1
    equals
    push '_root'
    getVariable
    push 'DS2'
    getMember
    push 0.0
    equals
    and
    push '_root'
    getVariable
    push 'DS3'
    getMember
    push 0.0
    equals
    and
    push '_root'
    getVariable
    push 'DS4'
    getMember
    push 0.0
    equals
    and
    not
    branchIfTrue label2
    push '_root'
    getVariable
    push 'DA1', '1'
    setMember
    push '_root'
    getVariable
    push 'DA2', '1'
    setMember
    push '_root'
    getVariable
    push 'DA3', '0'
    setMember
   label2:
    push '_root'
    getVariable
    push 'DS1'
    getMember
    push 1
    equals
    push '_root'
    getVariable
    push 'DS2'
    getMember
    push 1
    equals
    and
    push '_root'
    getVariable
    push 'DS3'
    getMember
    push 0.0
    equals
    and
    push '_root'
    getVariable
    push 'DS4'
    getMember
    push 0.0
    equals
    and
    not
    branchIfTrue label3
    push '_root'
    getVariable
    push 'DA2', '1'
    setMember
   label3:
    push '_root'
    getVariable
    push 'DS1'
    getMember
    push 1
    equals
    push '_root'
    getVariable
    push 'DS2'
    getMember
    push 1
    equals
    and
    push '_root'
    getVariable
    push 'DS3'
    getMember
    push 1
    equals
    and
    push '_root'
    getVariable
    push 'DS4'
    getMember
    push 0.0
    equals
    and
    not
    branchIfTrue label4
    push '_root'
    getVariable
    push 'DA1', '0'
    setMember
   label4:
    push '_root'
    getVariable
    push 'DS1'
    getMember
    push 1
    equals
    push '_root'
    getVariable
    push 'DS2'
    getMember
    push 1
    equals
    and
    push '_root'
    getVariable
    push 'DS3'
    getMember
    push 1
    equals
    and
    push '_root'
    getVariable
    push 'DS4'
    getMember
    push 1
    equals
    and
    not
    branchIfTrue label5
    push '_root'
    getVariable
    push 'DA1', '0'
    setMember
    push '_root'
    getVariable
    push 'DA2', '0'
    setMember
    push '_root'
    getVariable
    push 'DA3', '1'
    setMember
   label5:
    push '_root'
    getVariable
    push 'DS5'
    getMember
    push 0.0
    equals
    push '_root'
    getVariable
    push 'DS1'
    getMember
    push 1
    equals
    and
    not
    branchIfTrue label6
    push '_root'
    getVariable
    push 'DA4', '1'
    setMember
   label6:
    push '_root'
    getVariable
    push 'DS6'
    getMember
    push 1
    equals
    not
    branchIfTrue label7
    push '_root'
    getVariable
    push 'DA4', '0'
    setMember
   label7:
  end // of frame 3

  frame 3
    push '_root'
    getVariable
    push 'DA4'
    getMember
    push 1
    equals
    not
    branchIfTrue label1
    setTarget '_root.futoszal'
      nextFrame
    end
    branch label2
   label1:
    setTarget '_root.futoszal'
      prevFrame
    end
   label2:
  end // of frame 3

  frame 3
    constants 'oszlop', 'a', 'DA1', 'hozam', 'DA1Hozam', 'DA2', 'DA2Hozam', 'DA3', 'DA3Hozam', 'fok', 'homers_max', 'DA4', 'homers_no', 'homers_min', 'homers_csokk', 'sebesseg', 'DS1S', 'DS1', 'DS2S', 'DS2', 'DS3S', 'DS3', 'DS4S', 'DS4', 'viz'  
    push 'oszlop', 435, 'a'
    getVariable
    toNumber
    subtract
    setVariable
    push 'DA1'
    getVariable
    toNumber
    push 1
    equals
    not
    branchIfTrue label1
    push 'hozam', 'hozam'
    getVariable
    toNumber
    push 'DA1Hozam'
    getVariable
    toNumber
    subtract
    setVariable
    setTarget 'DA1csap'
      gotoFrame 0
      play
    end
    branch label2
   label1:
    setTarget 'DA1csap'
      gotoFrame 1
      play
    end
   label2:
    push 'DA2'
    getVariable
    toNumber
    push 1
    equals
    not
    branchIfTrue label3
    push 'hozam', 'hozam'
    getVariable
    toNumber
    push 'DA2Hozam'
    getVariable
    toNumber
    subtract
    setVariable
    setTarget 'DA2csap'
      gotoFrame 0
      play
    end
    branch label4
   label3:
    setTarget 'DA2csap'
      gotoFrame 1
      play
    end
   label4:
    push 'DA3'
    getVariable
    toNumber
    push 1
    equals
    not
    branchIfTrue label5
    push 'hozam', 'hozam'
    getVariable
    toNumber
    push 'DA3Hozam'
    getVariable
    toNumber
    subtract
    setVariable
    setTarget 'DA3csap'
      gotoFrame 0
      play
    end
    branch label6
   label5:
    setTarget 'DA3csap'
      gotoFrame 1
      play
    end
   label6:
    push 'fok'
    getVariable
    toNumber
    push 'homers_max'
    getVariable
    toNumber
    lessThan
    not
    branchIfTrue label7
    push 'DA4'
    getVariable
    toNumber
    push 1
    equals
    not
    branchIfTrue label7
    push 'fok', 'fok'
    getVariable
    push 'homers_no'
    getVariable
    toNumber
    add
    setVariable
   label7:
    push 'fok'
    getVariable
    toNumber
    push 'homers_min'
    getVariable
    toNumber
    greaterThan
    not
    branchIfTrue label8
    push 'DA4'
    getVariable
    toNumber
    push 0.0
    equals
    not
    branchIfTrue label8
    push 'fok', 'fok'
    getVariable
    push 'homers_csokk'
    getVariable
    toNumber
    subtract
    setVariable
   label8:
    push 'oszlop'
    getVariable
    toNumber
    push 255
    greaterThan
    not
    branchIfTrue label9
    push 'a', 180
    setVariable
    push 'oszlop', 255
    setVariable
    branch label10
   label9:
    push 'a', 'a'
    getVariable
    toNumber
    push 'hozam'
    getVariable
    toNumber
    push 'sebesseg'
    getVariable
    toNumber
    multiply
    add
    setVariable
   label10:
    push 'oszlop'
    getVariable
    toNumber
    push 0.0
    lessThan
    not
    branchIfTrue label11
    push 'a', 435
    setVariable
    push 'oszlop', 0.0
    setVariable
    branch label12
   label11:
    push 'a', 'a'
    getVariable
    toNumber
    push 'hozam'
    getVariable
    toNumber
    push 'sebesseg'
    getVariable
    toNumber
    multiply
    add
    setVariable
   label12:
    push 'oszlop'
    getVariable
    toNumber
    push 'DS1S'
    getVariable
    greaterThan
    not
    branchIfTrue label13
    push 'DS1', 1
    setVariable
    setTarget 'SLed1'
      gotoFrame 1
    end
    branch label14
   label13:
    push 'DS1', 0.0
    setVariable
    setTarget 'SLed1'
      gotoFrame 0
    end
   label14:
    push 'oszlop'
    getVariable
    toNumber
    push 'DS2S'
    getVariable
    greaterThan
    not
    branchIfTrue label15
    push 'DS2', 1
    setVariable
    setTarget 'SLed2'
      gotoFrame 1
    end
    branch label16
   label15:
    push 'DS2', 0.0
    setVariable
    setTarget 'SLed2'
      gotoFrame 0
    end
   label16:
    push 'oszlop'
    getVariable
    toNumber
    push 'DS3S'
    getVariable
    toNumber
    greaterThan
    not
    branchIfTrue label17
    push 'DS3', 1
    setVariable
    setTarget 'SLed3'
      gotoFrame 1
    end
    branch label18
   label17:
    push 'DS3', 0.0
    setVariable
    setTarget 'SLed3'
      gotoFrame 0
    end
   label18:
    push 'oszlop'
    getVariable
    toNumber
    push 'DS4S'
    getVariable
    toNumber
    greaterThan
    not
    branchIfTrue label19
    push 'DS4', 1
    setVariable
    setTarget 'SLed4'
      gotoFrame 1
    end
    branch label20
   label19:
    push 'DS4', 0.0
    setVariable
    setTarget 'SLed4'
      gotoFrame 0
    end
   label20:
    push 'viz', Y_PROPERTY, 'a'
    getVariable
    toNumber
    setProperty
  end // of frame 3

  frame 3
    constants 'oszlop', 'Math', 'round', 'AS1', 'fok', 'AS2', 'homers_max'  
    push 'oszlop'
    getVariable
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    push 0.0
    lessThan
    not
    branchIfTrue label1
    push 'AS1', 0.0
    setVariable
    branch label2
   label1:
    push 'AS1', 'oszlop'
    getVariable
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    setVariable
   label2:
    push 'fok'
    getVariable
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    push 0.0
    lessThan
    not
    branchIfTrue label3
    push 'AS2', 0.0
    setVariable
    branch label4
   label3:
    push 'AS2', 'fok'
    getVariable
    push 255, 'homers_max'
    getVariable
    divide
    multiply
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    setVariable
   label4:
    push 'oszlop'
    getVariable
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    push 255
    greaterThan
    not
    branchIfTrue label5
    push 'AS1', 255
    setVariable
   label5:
    push 'fok'
    getVariable
    push 1, 'Math'
    getVariable
    push 'round'
    callMethod
    push 255
    greaterThan
    not
    branchIfTrue label6
    push 'AS2', 255
    setVariable
   label6:
  end // of frame 3

  frame 3
    push 'SLed1', Y_PROPERTY, 305, 'DS1S'
    getVariable
    subtract
    setProperty
    push 'SLed2', Y_PROPERTY, 305, 'DS2S'
    getVariable
    subtract
    setProperty
    push 'SLed3', Y_PROPERTY, 305, 'DS3S'
    getVariable
    subtract
    setProperty
    push 'SLed4', Y_PROPERTY, 305, 'DS4S'
    getVariable
    subtract
    setProperty
  end // of frame 3

  defineMovieClip 35 // total frames: 2
  end // of defineMovieClip 35

  defineMovieClip 37 // total frames: 1
  end // of defineMovieClip 37

  defineMovieClip 40 // total frames: 100

    frame 0
      stop
    end // of frame 0
  end // of defineMovieClip 40

  defineMovieClip 44 // total frames: 2
  end // of defineMovieClip 44

  defineButton 46

    on overUpToOverDown
      constants 'DA1'  
      push 'DA1'
      getVariable
      toNumber
      push 0.0
      equals
      not
      branchIfTrue label1
      push 'DA1', 1
      setVariable
      branch label2
     label1:
      push 'DA1', 0.0
      setVariable
     label2:
    end
  end // of defineButton 46

  defineButton 47

    on overUpToOverDown
      constants 'DA2'  
      push 'DA2'
      getVariable
      toNumber
      push 0.0
      equals
      not
      branchIfTrue label1
      push 'DA2', 1
      setVariable
      branch label2
     label1:
      push 'DA2', 0.0
      setVariable
     label2:
    end
  end // of defineButton 47

  defineButton 48

    on overUpToOverDown
      constants 'DA3'  
      push 'DA3'
      getVariable
      toNumber
      push 0.0
      equals
      not
      branchIfTrue label1
      push 'DA3', 1
      setVariable
      branch label2
     label1:
      push 'DA3', 0.0
      setVariable
     label2:
    end
  end // of defineButton 48

  frame 4
    push 'hozam', 0.0
    setVariable
    setTarget 'viz'
      push 'oszlop'
      getVariable
      toNumber
      gotoAndPlay
    end
  end // of frame 4

  frame 4
    gotoLabel 'start'
    play
  end // of frame 4
end
