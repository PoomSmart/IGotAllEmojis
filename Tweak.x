#import "../Emoji/EmojiLibrary/PSEmojiUtilities.h"

static NSMutableArray *getEmojis(id emojis) {
    if ([emojis respondsToSelector:@selector(allObjects)])
        return (NSMutableArray *)[(NSSet *)emojis allObjects];
    return emojis;
}

%hook FBEmojiUnicodeStore

+ (instancetype)sharedStoreWithOSVersionCheck:(bool)osCheck {
    return %orig(false);
}

- (NSMutableArray *)smileysAndPeopleEmojis {
    return getEmojis([PSEmojiUtilities PeopleEmoji]);
}

- (NSMutableArray *)activityEmojis {
    return getEmojis([PSEmojiUtilities ActivityEmoji]);
}

- (NSMutableArray *)animalsAndNatureEmojis {
    return getEmojis([PSEmojiUtilities NatureEmoji]);
}

- (NSMutableArray *)flagsEmojis {
    return getEmojis([PSEmojiUtilities FlagsEmoji]);
}

- (NSMutableArray *)foodAndDrinkEmojis {
    return getEmojis([PSEmojiUtilities FoodAndDrinkEmoji]);
}

- (NSMutableArray *)objectsEmojis {
    return getEmojis([PSEmojiUtilities ObjectsEmoji]);
}

- (NSMutableArray *)symbolsEmojis {
    return getEmojis([PSEmojiUtilities SymbolsEmoji]);
}

- (NSMutableArray *)travelAndPlacesEmojis {
    return getEmojis([PSEmojiUtilities TravelAndPlacesEmoji]);
}

- (NSMutableSet *)emojiEligibleForSkintone {
    id emojis = [PSEmojiUtilities SkinToneEmoji];
    return [emojis respondsToSelector:@selector(allObjects)] ? emojis : [NSSet setWithArray:emojis];
}

%end