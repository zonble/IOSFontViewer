#import "FVFontsTableViewController.h"
#import "FVFontViewController.h"

@implementation FVFontsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self) {
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.fontFamilyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(localizedCompare:)];
	self.title = @"Fonts";
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.fontFamilyNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"FontCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	NSString *fontName = [self.fontFamilyNames objectAtIndex:indexPath.row];
	cell.textLabel.text = fontName;
	cell.textLabel.font = [UIFont fontWithName:fontName size:20.0];
	return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	FVFontViewController *fontViewController = segue.destinationViewController;
	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	NSString *fontName = [self.fontFamilyNames objectAtIndex:indexPath.row];
	fontViewController.title = fontName;
	fontViewController.font = [UIFont fontWithName:fontName size:15.0];
}

@end
