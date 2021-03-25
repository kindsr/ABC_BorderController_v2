3M Page Reader SDK 3.3.3.10

Rollup 4
- PDF417 decoder fix to read barcode with only 3 or less lines of data.
- Fix CD_BACKEY_CORRECTION HighLevelAPI data callback was not being called due to a bug introduced in previous patch in Rollup 1.
- (.NET wrapper only) Fix CD_BACKEY_CORRECTION HighLevelAPI .NET data callback which could introduce garbage data when correcting an MRZ if the original/incorrect MRZ
  is shorter than the corrected MRZ.  This could cause MRZ correction to fail even though the correct MRZ was entered.


Rollup 3
- .NET 4.0 wrapper rebuilt with original file version for compatability with existing .NET SDK applications in BIN folder.
- ePassport Cert Store - Check for overlapping DV cert where a newer DV cert is present, but does not
have an IS yet and the previous DV is still valid with IS cert.  Keep the older
and still valid DV with IS instead of tossing it for the newer DV and no IS yet.

Rollup 2
- Cropping fix to FindSides if using if using standard IR image for document location.  HighLevel setting (UseFirstImageCapturedForLocate=1).
  This could cause an overcrop of a smaller document if a finger is also on the side of the document/ID card.
- Cropping updates to help avoid capturing fingers above ID cards.
- High Level API - Fixed PDF417 auto-orientation. Auto-orientation by PDF417 was finding PDF417 when not present and rotating ID card improperly.
- .NET 2.0 wrapper fix for an enumeration error
- .NET 4.0 wrapper fix to pass back CodelineData.ImageSource properly
- ePassport update to connect to chip with PCSC exclusive access to prevent other applications from causing chip read errors

Rollup 1

- Fix memory leak in the GetHash method used for passport operations
- Fix potential SAC memory leak
- High Level - fix memory leak from PASSIVE_AUTHENTICATION status
- Fix passport enumeration missing commas
- Add passport support for reading with larger buffer sizes and extended APDUs
- Fix potential memory leak in document location code FindTop.
- Fix finding location of top document edge.
- PDF417 decoder improvements and fixes for potential memory leaks and access violations.
- RdrDev USB check for garbage image width/height
- Fixed a bug in the FILE_SIZE logging strategy where it was finding the second '.' in the path and not the filename.
- Cropping fix for finding sides of some passports with PDF417 barcodes causing an undercrop of the right edge.
- Change default RF read buffer size to 4096 (puRFProcessSettings.puReadBinaryBufferSize) from 220.
This value gets used if we determine the chip supports extended APDUs from its ATR and faster read times are achieved.
A read buffer size of 220 is used if we determine extended APDU is not supported from the ATR.  If EF.ATR is enabled
(puRFProcessSettings.puReadBinaryUseEFATRIfPresent) and present, then it overrides the buffer size.
- Add a fix for passports whose DG2 files are not encoded properly
- Added log message for Extended Length APDU support by parsing the ATR
- Cropping fix for top overcrop and undercrop (front of glass) of some ID cards
- Add firmware version to level 5 log
- Fix High Level API issue with RF password callback being fired with no data when scanning a document after disconnecting/reconnecting the reader or connecting
the reader after the SDK is started.
- High Level API - added missing MMMReader_LL_AdjustSettingsByDPI call to LoadAndProcessFromScanDirectory() function
- High Level API - Added missing call to ClearDocumentData() at being of LoadAndProcessFromScanDirectory()
